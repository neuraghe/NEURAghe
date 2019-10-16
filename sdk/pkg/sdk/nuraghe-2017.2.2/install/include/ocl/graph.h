/*
 * Copyright (c) 2013 Germain Haugou
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#ifndef __OPENCL_CLE_H
#define __OPENCL_CLE_H

#include <ocl/graph_types.h>

#ifdef __cplusplus
extern "C" {
#endif
  
  /**
   * \brief Initializes the library
   *
   * This must be called once before any other operation is called.
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleInit();

  /**
   * \brief Loads a binary
   *
   */
  extern int cleLoadProgram(cle_program_t *program, void *binary, int size);
  
  /**
   * \brief Creates a kernel from a binary
   *
   */
  extern int cleCreateKernel(cle_program_t *program, cle_kernel_t *kernel, char *name, int *stackSize);

  /**
   * \brief Creates a buffer
   *
   */
  extern int cleCreateBuffer(cle_buffer_t *buffer, cle_buffer_location_e location, int size);

  /**
   * \brief Maps a buffer
   *
   */
  extern int cleMapBuffer(cle_buffer_t *buffer, void **addr);

  /**
   * \brief Creates a graph
   *
   * Allocates a graph and initializes it. The number of parameters of the graph must be
   * specified.
   *
   * \param[out] graph The allocated graph is returned here
   * \param[in] nbData The number of parameters for the graph (note: this will be removed soon)
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleGraphCreate(cle_graph_t **graph, int nbParam);

  /**
   * \brief Creates a super graph
   *
   * Allocates a super graph and initializes it. A super graph is a set of graph that is commonly
   * used for building inter-cluster pipelines. The list of graphs must be specified in the order
   * in which they must be scheduled on the available clusters in order to match the pipeline.
   * The sub-graphs must be created and then passed in the graph list. They must be built after 
   * the super-graph creation.
   *
   * \param[out] graph The allocated graph is returned here
   * \param[in] nbGraph The number of graph of the super graph
   * \param[in] graphLisy A list of pointers to the graphs
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleSuperGraphCreate(cle_graph_t **_graph, int nbGraph, cle_graph_t **graphList);
  
  /**
   * \brief Creates a node for buffer creation
   *
   * This creates a node in the graph that, when scheduled, allocates a buffer in the specified
   * memory. The node has no effect if the memory allocation fails.\n
   * The buffer information (base) must be stored in a graph parameter so that other nodes can retrieve
   * it in order to access the buffer.
   *
   * \param[in] graph The graph for which the node is created
   * \param[out] node The allocated node is returned here
   * \param[in] location This specified where the buffer must be allocated (soc memory, device memory ...)
   * \param[in] size The size of the buffer in bytes
   * \param[in] index The graph parameter index where the buffer information will be stored
   * \param[in] nbDep The number of dependencies of this node
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleGraphCreateBuffer(cle_graph_t *graph, cle_graph_node_t **node, cle_buffer_location_e location, int size, int index, int nbDep);

  /**
   * \brief Creates a node for buffer copy
   *
   * This creates a node in the graph that, when scheduled, enqueued a DMA transfer that will copy a 
   * a portion of a source buffer to a portion of a destination buffer.\n
   * Each buffer portion is described through a graph parameter index, filled in by a buffer creation node,
   * and an offset added to the buffer base address to get the final base address of the transfer.\n
   * The transfer is 2-dimensional in order to allows describing the transfer of a block.
   *
   * \param[in] graph The graph for which the node is created
   * \param[out] node The allocated node is returned here
   * \param[in] ext2loc Should be 1 if the transfer is from the most external location to most local one, 0 in the contrary. For example L3 to L1, L3 to L2 and L2 to L1 are considered as external to local whereas L1 to L2, L2 to L3 and L1 to L3 are considered as local to external.
   * \param[in] extIndex The index of the graph parameter describing the external buffer
   * \param[in] extOffset The offset that is applied to the base address of the external buffer
   * \param[in] locIndex The index of the graph parameter describing the local buffer
   * \param[in] locOffset The offset that is applied to the base address of the local buffer
   * \param[in] size The size of the transfer
   * \param[in] length The length of a line
   * \param[in] stride The stride applied between lines
   * \param[in] nbDep The number of dependencies of this node
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleGraphCopyBuffer(cle_graph_t *graph, cle_graph_node_t **node, int ext2loc, int extIndex, int extOffset, int locIndex, int locOffset, int size, int length, int stride, int nbDep);

  /**
   * \brief Creates a node for buffer copy between 2 sub-graphs of a super-graph
   *
   * This creates 1 node in each sub-graph. The 2 nodes will be scheduled only when the dependencies of the 
   * 2 nodes has finished, and this will enqueue a single DMA transfer from cluster running the local
   * graph to the cluster running the remote graph. The description of the transfer is the same as for 
   * standard copies (cleGraphCopyBuffer) except than the buffer descriptions refers to 2 different graphs.
   * 
   * \param[in]  remGraph  The remote graph for which the remote node is created. This graph is the destination of the transfer.
   * \param[out] remNode   The node of the remote graph
   * \param[in]  locGraph  The local graph for which the local node is created. This graph is the source of the transfer.
   * \param[out] locNode   The node of the local graph
   * \param[in]  remIndex  The index of the graph parameter describing the remote buffer
   * \param[in]  remOffset The offset that is applied to the base address of the remote buffer
   * \param[in]  locIndex  The index of the graph parameter describing the local buffer
   * \param[in]  locOffset The offset that is applied to the base address of the local buffer
   * \param[in]  size      The size of the transfer
   * \param[in]  nbRemDep  The number of dependencies of the remote node
   * \param[in]  nbLocDep  The number of dependencies of the local node
   */
  extern int cleSuperGraphCopyBuffer(cle_graph_t *remGraph, cle_graph_node_t **remNode, cle_graph_t *locGraph, cle_graph_node_t **locNode, int remIndex, int remOffset, int locIndex, int locOffset, int size, int nbRemDep, int nbLocDep);

  /**
   * \brief Creates a node for kernel execution
   *
   * This creates a node in the graph that, when scheduled, enqueues a kernel execution on the specified
   * number of cores. A buffer must be specified for the stacks.
   *
   * \param[in] graph  The graph for which the node is created
   * \param[out] node The allocated node is returned here
   * \param[in] kernel The kernel that must be executed
   * \param[in] nbCores The number of cores that must execute the kernel
   * \param[in] stackBufferIndex The index of the graph parameter that contains the buffer used for tha stacks
   * \param[in] stackBufferOffset The offset added to the buffer base address used for stacks
   * \param[in] nbDep The number of dependencies of this node
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleGraphExecKernel(cle_graph_t *graph, cle_graph_node_t **node, cle_kernel_t *kernel, int nbCores, int stackBufferIndex, int stackBufferOffset, int stackBufferSize, int nbDep);
     
  /**
   * \brief Sets a parameter of a kernel execution to a value
   *
   * This allows specifying the value of the argument of a kernel execution. This is only
   * allowed for scalar arguments, no for buffers.
   *
   * \param[in] graph  The graph containing the specified node
   * \param[in] node The node for which the parameter is specified
   * \param[in] kernel The kernel associated to the kernel execution
   * \param[in] index The index of the kernel argument that must be set
   * \param[in] data A pointer to the value that must be stored in the argument
   * \param[in] size The size of the argument (note: will be removed soon)
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleGraphSetKernelParamValue(cle_graph_t *graph, cle_graph_node_t *node, cle_kernel_t *kernel, int index, void *data, int size);

  /**
   * \brief Sets a parameter of a kernel execution to a graph parameter
   *
   * This allows setting a kernel argument of type buffer. It can only be set to a buffer described
   * in a graph parameter. The buffer will be taken from the graph parameter when the node is scheduled,
   * which means that it will take the last buffer stored by previous node executions.
   *
   * \param[in] graph  The graph containing the specified node
   * \param[in] node The node for which the parameter is specified
   * \param[in] kernel The kernel associated to the kernel execution
   * \param[in] index The index of the kernel argument that must be set
   * \param[in] dataIndex The index of the graph parameter where the buffer is described
   * \param[in] dataOffset The offset that must be added to the base address of the buffer
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleGraphSetKernelParamData(cle_graph_t *graph, cle_graph_node_t *node, cle_kernel_t *kernel, int index, int dataIndex, int dataOffset);

  /**
   * \brief Creates a node for splitting dependencies
   *
   * This creates a node in the graph that, when scheduled, enqueues the execution of the nodes
   * specified as dependencies. This is a way to gather a lot of dependencies within a single node
   * in order to simplify the graph.
   *
   * \param[in] graph The graph for which the node is created
   * \param[out] node The allocated node is returned here
   * \param[in] nbDep The number of dependencies of this node
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleGraphSplitDep(cle_graph_t *graph, cle_graph_node_t **node, int nbDep);

  /**
   * \brief Creates a node for buffer release
   *
   * This creates a node in the graph that, when scheduled, releases the specified buffer, in order 
   * to free its memory. The buffer is taken from the graph parameter when the node is executed, which
   * means it is the last buffer stored by previous node executions.
   *
   * \param[in] graph The graph for which the node is created
   * \param[out] node The allocated node is returned here
   * \param[in] index The index of the graph parameter that describes the buffer ot be released
   * \param[in] nbDep The number of dependencies of this node
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleGraphReleaseBuffer(cle_graph_t *graph, cle_graph_node_t **node, int index, int nbDep);

  /**
   * \brief Creates a node for end of graph
   *
   * This creates a node in the graph that, when scheduled, triggers the end of the graph executon.\n
   * A notification is sent to the host side, that may unblock something, and the cluster executing
   * the graph is made available for another graph execution.
   *
   * \param[in] graph The graph for which the node is created
   * \param[out] node The allocated node is returned here
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleGraphEndGraph(cle_graph_t *graph, cle_graph_node_t **node);

  /**
   * \brief Sets the dependency of a graph node
   *
   * When a node is created, the number of dependencies must be specified. This function allows setting
   * one of these dependencies. Note that all dependencies must be speicifed. The dependency will be
   * scheduled only after the node has finished execution.
   *
   * \param[in] graph  The graph containing the specified node
   * \param[in] node The node for which the parameter is specified
   * \param[in] depIndex The dependency number. This number must be inferior to the number of dependencies 
   *                     specified when the ndoe has been created
   * \param[in] dep The dependency. This must has been returned by one of the node creation operations
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleGraphSetNodeDep(cle_graph_t *graph, cle_graph_node_t *node, int depIndex, cle_graph_node_t *dep);

  /**
   * \brief Sets a graph parameter to a global buffer
   *
   * This allows setting a graph parameter to a previously created global buffer.\n
   * The global buffers set through this fonction are the input and output buffers of the graph.
   *
   * \param[in] graph The graph instance for which the parameter is set
   * \param[in] index The index of the graph parameter
   * \param[in] index The global buffer
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleGraphSetBuffer(cle_graph_instance_t *graph, int index, cl_mem buffer);

  /**
   * \brief Builds a graph
   *
   * Before a graph execution can be enqueued, the graph must be built. This operation is in charge
   * of verifying the graph and transforming him so that it can be efficiently executed by the
   * runtime. This operation can be heavy due to the transformions and thus has to be done outside
   * the critical path.\n
   * Once built, only the parameters of the graph can be modified, in particular its global buffers
   * in order to iterate on different input and output buffers.
   *
   * \param[out] instance The graph instance is returned here
   * \param[in] graph The graph that must be built
   * \param[in] command_queue The command queue on which the graph will be submitted
   * \param[out] graphSize If not null, the graph size once loaded in the fabric is returned
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleGraphBuild(cle_graph_instance_t **instance, cle_graph_t *graph, cl_command_queue command_queue, int *graphSize);

  /**
   * \brief Generates a dot file of the graph
   *
   * \param[in] graph The graph that must be displayed
   * \param[in] path The path to the file in which the graph must be dumped
   *
   * \return 0 if the operation is successfull, -1 if it failed
   */
  extern int cleGraphDisplay(cle_graph_t *graph, char *path);

#ifdef __cplusplus
}
#endif

#endif  /* __OPENCL_CLE_H */

