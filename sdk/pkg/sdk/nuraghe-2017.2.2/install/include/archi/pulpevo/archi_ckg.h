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

#ifndef __ARCHI_CKG_H__
#define __ARCHI_CKG_H__

#define CKG_IRQ_MASK_LOW_BASE             0X100
#define CKG_IRQ_MASK_LOW_SIZE             0X040
#define CKG_IRQ_MASK_HIGH_BASE            0X140
#define CKG_IRQ_MASK_HIGH_SIZE            0X040
#define CKG_IRQ_BUFFER_LOW_BASE           0X180
#define CKG_IRQ_BUFFER_LOW_SIZE           0X040
#define CKG_IRQ_BUFFER_HIGH_BASE          0X1C0
#define CKG_IRQ_BUFFER_HIGH_SIZE          0X040

#define CKG_READ_IRQ_ID_BASE                    0X21C
#define CKG_READ_IRQ_ID_SIZE                    0X040

#endif
