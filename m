Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556459;
	b=YAkv/afAioh6S0nqOsZje3xRakfeYa9FiL96zLD7DGxmTKHnj5veSsi9NjsQeR1WSHTY
	 uQSzqhKUC6WB1JogMrp+++UUJaGMve9hNAMyV5N2mhXOvXEU5xeD4dKbSvQjowVfRFfDf
	 kE9aYghN0+LUzguxdQY76M2CX/0vEOF5vbiTmTQ+9qL1XcAZlEVPbovgW311ceNkoCwCZ
	 L2NmjdyCSSpeWuD4viRcXLdcNMcvk/WMrSZmOEr2ghWaYORaZ8ulBPPg3EYM8w7TGA/T+
	 N/5QmbMNSios1ouqH4FxoButXOmPZ1I9NQheCbRzfZmj2k/X2znUVUqF5oSgea1GWuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w42z6p6tUvCwMwZ0RdL3hWrj/QD/3zaQrRloQWU7Khg=;
	b=evQi1nsjZbmifYviptbgnibsCMDnGZpNAmdOpkyqbV3n5C1GfW+WNFMlukkSngaCZgYU
	 YOisdRvEegJ2UiLXYRVtN4eMgck/rM43klYaFpDZDGfqu+mf/aAVR+c0auly1bzHx6xQE
	 TNKvCyF4YRHpDPtVEz/WKROWfAqp0Z4LKb4X6KqeCfael5SOgnvLIENUOc6XqW+DX8tMB
	 43EaQQJtxptuxTyHjpr/fXAkkW7+1oiq3HJG5B3wWzrbUeH6XfSsA3nIiPSXnTw/cq95N
	 0jekWlJTC5568tVIoAUO9fygt1JvmudUEMjk9QK8TEAhZmieK5xfv/cLKLODj8lZW7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjhCQDxj;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E190606A334
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E190606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjhCQDxj
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d2ccd3c7a2so1693679137.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556457; x=1796161257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w42z6p6tUvCwMwZ0RdL3hWrj/QD/3zaQrRloQWU7Khg=;
        b=yjhCQDxjYobdGBu8sg3D0o233SJfjxrR8hjxGeet+/gqhco/LIWFYS8K+YCDPfmRK+
         OKDWwHCuqrJiLO7OxplHM2S7Lskshv4o/6p7vNeUvYsxEe9GXa8s+/OEuz+L+gGYpebJ
         uEGAohwARfNlwShXkRwrP/99abHe7V0XVbj8cEQXG5yHhwkPNea6BZqXRaTVtvk0slny
         eTr5WtB5t0KMXM9O8ugq+Qveem3q3tpNheF0QZGbv3+UJE0/P9CArEYuFm686gVj4hJ5
         0n2MWj4Q8FtyJva5Xs7pVRPe/IiDDAK5X4CteY5IgT9zUJm83rHWMokZ0uIS54L5Mt1X
         vDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556457; x=1796161257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w42z6p6tUvCwMwZ0RdL3hWrj/QD/3zaQrRloQWU7Khg=;
        b=KcavZcyilA/7hrUmy5Parl/GURH9rJRqmo9e3N5wz7X8pCCn/vzdMB8udRfe84TNI5
         tra9BFvIdwStBpgyIJ5qkYpHUKoc31+4iwmex3nCBVefzH0mqwKnyav0KmDfvO3143JE
         k2wDbN6HbYgARKhWOj/UKgTS9A1E0bUimrnYT5JYyqL7k3qFV1yqWe3Kr9femwsyH6bB
         KBIjltRn2+3TNLuFv1JHGqRTVU3mC1hpLXfoiZumUgZ2jm/K81AjUVOvsI3bpq7nyx74
         2dfC1GPm89PwMoGD6W0e7r/Nfw5zVHRrW99yQgdpcrjHyC/gRuFtlHAhfb5BKiwO1+Pq
         IKKg==
X-Forwarded-Encrypted: i=1; AL+hErG4ygxBSo6IvnNDFwlCOCrX9d9DHJfjuSwirLAvrE/EJ+K+o9Vj3TNz0QuyB2LRa2JEOnYXrYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EbMccXW/Zu+RuRKphFs7I7HHrOVSZHtvb8/VoN7kFdv9UXlAY
	TPtwp5UyytZGNs25vyaQDOMdwHXhFezPKtPyLcU7mBNACTL55VjeRpfX
X-Gm-Gg: AZFdTZf0ZJ+lSzlnmEJZ+Q9QVBFK9xF4v3b4VJnMSAJNL/fJzGqFek2gCcgcx9j83D9
	ROfU8aFF4Cjk0rB04JKQBvHO19XRnxQUR+1La9HOxu8zw0Cq8AYbLcsG7wX6+k9iNjLx9OVE+bH
	VS8TF/C+gt7vHNvQeVDTuIeb1q0TogFIv1InFiDD8m90RK+jzTInLYotWU+7xNQW/TIDNt/FuKm
	6boZbQZhwcTri+3EGG+AXmozoAX1Ut5bpHwBj1qnHqYliXfXicxWPNlx6MOEC/uEccOE/pQi2Uq
	0YV8aPRryKjDo2iyhduNgtQrMFSamXEdB0N2WilPwnF8QiyBWI0wcV929/f9X2pY/scCPz2rE5h
	1NS5cPpOjic1GRZt5Dr4/3cyd3GULPGQBcTmO97ty8w5rQS9rq/4BNPOj9ogBjoKbJKMRpy9doL
	giK+jl0TG7ySqjjzf2e6Fk8WMEKDF+AqLy/70yQkC2R3oCwvr4BBuk9VBSi7p7TM4oZeGBtgiKn
	32EAIALv96WhGSXQ8S+cHvay/75zlkWnePK/5wLDMGcHwkeG9pk+QHE+im/pnwGBmqCZSjoIDI3
	j9YWEZ0OxgpNTGh8D6xW/6cOK9dco9wz3WcTsqX/U9RsJf3z2jQT
X-Received: by 2002:a05:6102:644d:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7d739356a57mr7901936137.9.1795556457444;
        Tue, 24 Nov 2026 13:40:57 -0800 (PST)
Received: from emedev.tailf75c28.ts.net ([179.238.117.100])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6dec57ddsm15952879241.1.2026.11.24.13.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:40:57 -0800 (PST)
From: Emerson Busson <emersonbusson@gmail.com>
To: Wei Liu <wei.liu@kernel.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Kelley <mhklinux@outlook.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Kameron Carr <kameroncarr@microsoft.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] hv: vmbus: allocate requestor metadata with kvcalloc()
Date: Tue, 24 Nov 2026 18:40:29 -0300
Message-ID: <20261124214030.174246-4-emersonbusson@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124214030.174246-1-emersonbusson@gmail.com>
References: <20261124214030.174246-1-emersonbusson@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Opening a VMBus channel allocates a request-ID array and bitmap sized
from the ring buffer. For a 128-page NetVSC ring, kcalloc() and
bitmap_zalloc() require multi-page physically contiguous allocations
that can fail under buddy fragmentation even when order-0 pages remain
available.

Switch both guest-private structures to kvcalloc() and free them with
kvfree(), keeping slab allocation for small channels while allowing
vmalloc fallback under fragmentation. Guard against a zero requestor
size and clear the pointers after freeing.

Signed-off-by: Emerson Busson <emersonbusson@gmail.com>
---
 drivers/hv/channel.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index c0bf154915..8547b10f3d 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -733,10 +733,13 @@ EXPORT_SYMBOL_GPL(vmbus_alloc_buffer);
  */
 static u64 *request_arr_init(u32 size)
 {
-	int i;
+	u32 i;
 	u64 *req_arr;
 
-	req_arr = kcalloc(size, sizeof(u64), GFP_KERNEL);
+	if (!size)
+		return NULL;
+
+	req_arr = kvcalloc(size, sizeof(*req_arr), GFP_KERNEL);
 	if (!req_arr)
 		return NULL;
 
@@ -763,9 +766,10 @@ static int vmbus_alloc_requestor(struct vmbus_requestor *rqstor, u32 size)
 	if (!rqst_arr)
 		return -ENOMEM;
 
-	bitmap = bitmap_zalloc(size, GFP_KERNEL);
+	bitmap = kvcalloc(size / BITS_PER_LONG + !!(size % BITS_PER_LONG),
+			  sizeof(*bitmap), GFP_KERNEL);
 	if (!bitmap) {
-		kfree(rqst_arr);
+		kvfree(rqst_arr);
 		return -ENOMEM;
 	}
 
@@ -784,8 +788,10 @@ static int vmbus_alloc_requestor(struct vmbus_requestor *rqstor, u32 size)
  */
 static void vmbus_free_requestor(struct vmbus_requestor *rqstor)
 {
-	kfree(rqstor->req_arr);
-	bitmap_free(rqstor->req_bitmap);
+	kvfree(rqstor->req_arr);
+	kvfree(rqstor->req_bitmap);
+	rqstor->req_arr = NULL;
+	rqstor->req_bitmap = NULL;
 }
 
 static int __vmbus_open(struct vmbus_channel *newchannel,
-- 
2.43.0

