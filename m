Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749904;
	b=Qo8B6lQaub5Vi6IemqRWPBQVxEb+zvgkKp20BQeJ3R6OsP4HJUricSpd4IuLBJndYz7s
	 BWIvhPIWJ6Td2udLZIHoUCGR4crdUgleTRpVAGw69YKPc7W0xEIJZehdmqG9m/tr2twl9
	 ASNzzriUxpGv5PL3+BvSEtgGYxEsUPqkPJfDMUln7Q77+ETLu7llrhVH/xmMpPf7lXbtO
	 eWG0Nj7sY+DfZLKTRPzn/t/aaOqPNGPRitOkhAGoQm3hpu6WOXch2oJbv3ZatfQCCJ+bF
	 Z6dA9dloJfC3TTL13O2JXEYFZmwkMnethbsNBSaexk911cV92fQcRK7OjXYmPeXG97Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=52am0+RGOkzPAIjdsmAaqktJxCKhWTpn1uKgbfEsWmg=;
	b=v13RpO0hAiZqyh4Jny/8JjSA6PHsPKNv/XjwJGYAVEQ+TsF1kCTy2f0C26rkFsrjQg7q
	 h6ZrMMJdkkZVoc5X0H6M1nF7YK+g+PvPVN2Zn5z5ZTj9Z78dVRVVl8Yro+3Fmb1BfjcDW
	 0AeE7sYMVyFUXjHOeNrm1pS0nZWpgonvWx8SxKl89+pf+k1bZ64323p4FvF3iexkd+YjD
	 gOsXrL7r7/tP2cVYgnjEwkiWkgbY+9Qsw5KSSOsqcGYm9otyrW6wafflo6jQSsdbCvXjW
	 9id5uZpVbKcTKmFfjmsSBExQ22LYYx5phoHME/pbDP/YhXHMJD1+EYrnSyvUgURTsKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=(null) smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=VBplC0tr;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92109606A323
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92109606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=VBplC0tr
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so5034236a12.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795749894; x=1796354694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=52am0+RGOkzPAIjdsmAaqktJxCKhWTpn1uKgbfEsWmg=;
        b=VBplC0trq5gc/oMI9ml+w8lfea3+OGihGigPqvVdBDIeBZX6KKDeyAYX2Q3+sksY5j
         DyOfaqj1sbFvBPd0lnYPLH7TjaSnfGBYLMF7gGF0B33mlMOkf9r9Px6FmS3PhrU6u7xO
         T67urYUqrKu9/33loMpXtc/ZAwH+c5IHeQu8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749894; x=1796354694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52am0+RGOkzPAIjdsmAaqktJxCKhWTpn1uKgbfEsWmg=;
        b=bai67PtNajWbSKZ1q65n8ZTyLb1hBKYkt2jF6j3WZfWJ89mC9U2MIT03cZUztMWp9Q
         u5wKHPY+qXDzsuMhNIfO2IluysJUZYbEGpsTcOB0F5YGbmbQbdgxyXhxHD9EGwlRIidw
         2DErrriZfPOvMScUBrlOBSe6JLP2L6EWNx56UnE9I7vLAeBeMBBC1edX5yDlb16bWjnA
         zk5vy2UCg45UxQjBIJ3lQstC3eHC3gdI4Cyx90vbaPMoNucePoe2BZ8Aq2q7s0TRAbHl
         qiaEmt3qnxOgcDJ2AfUiH5NBJB/fpoBUa0RnQZEzEEKQ1CcYmNwxUqaJxC/UQcBvGz79
         u4+Q==
X-Gm-Message-State: APuU4Z+p8mmkiiby4mKCPNV0VDU+B04bSEqLs5Jo4tf/RvyFdA48PdTy
	CoF2rXsm21oDvaQ/oe65CgcvN3wLLv1KPZmQt58iaum46cwkL7U93cE9zkNAfS2dgjQ=
X-Gm-Gg: AZFdTZflwVyWPHHuwVMK8EAL3hqJtts6xIfPjj5wXJJZPwijE3tjT2Erj7ObazZoa1Q
	Drri5YWzRa2xxKEvLtr90lfqDVHARs3O5hDiu6YKXY1CN51jjYcJOows2H36Qbg+7/00YBAawTK
	hoko8h5b6nSLGi42zjEk7KGY2s1jPdKQXEZ9T+o8/99+gfMBWmv78mXDdLdLJmtGKoJHI9G+5kk
	V8m/k7zGSdZlI/i8g6qRDosFnf0ELzdatfPyLaI2BsuLrmiXzWC0ysYh3InYp9oO7xUULr0raKT
	16g0EnwHOYmdVIAsIosICjtmXmDH0OWn+3rdDjnV0q8yCGIoCGD/QLgOpYUOdBzwVUbXjtNZ3sS
	luJ9p6l2Q0IPxWQGRFD0E0btCw+PGmeud/KXZsXPsfP/+wkpSCAu0ySdEDWk3I1kfvSh0Kn86h+
	qDylAEwXB3fyMbyjzIh+Tah2jxOVOEKTvCDBmQ0FehDNnT+23fvTVborjSp10xjA+YbLusam56d
	00owxS0iw66QjTPdCj51wRy9B2OJ8me7sahnbBcwjCkFaFZ9hM0HeHJcH1d4l5SlFXlIEkn1wuD
	8MJvmDRP/GXsSOyZq60f4hNwNCd7EezoQyJhwpEbUSxrFQi6w3fqyDGLEFyQjGUv0KQGUwVzrcx
	TCikpUgjrzyousVPEdBwb4r3vHiU3qIMjxcmKxmv/hsb6sKUAb/RUvhXS46+ZBKouFSdg9OnSKN
	dDKemnDJ3PZw==
X-Received: by 2002:a17:90b:4c4c:b0:3b3:ab74:cc9a with SMTP id 98e67ed59e1d1-3b41c55a3f1mr22245299a91.0.1795749893896;
        Thu, 26 Nov 2026 19:24:53 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm35791634a91.8.2026.11.26.19.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:24:52 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	linux-afs@lists.infradead.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kapil@presceralabs.ai
Subject: [PATCH net] rxrpc: fix the test for a sequence number being in a Tx queue
Date: Fri, 27 Nov 2026 08:54:48 +0530
Message-Id: <20261127032448.2631400-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

rxrpc_seq_in_txq() masks the sequence number down to the queue size and
compares the result with tq->qbase, but qbase is a whole sequence number,
not an index.  A new queue is only allocated when send_top + 1 is a
multiple of RXRPC_NR_TXQUEUE, so qbase is 0, 64, 128 and so on.  That makes
the test wrong in both directions: for the first queue it is true for every
sequence that is a multiple of 64, and for every later queue it can never
be true at all.

rxrpc_input_soft_ack_tq() uses it to decide whether the tail loss probe is
in the queue it is looking at:

	if (call->tlp_serial &&
	    rxrpc_seq_in_txq(tq, call->tlp_seq) &&
	    test_bit(call->tlp_seq - tq->qbase, &new_acks))

new_acks is a single unsigned long, so when the probe is at sequence 64 and
qbase is 0 the test_bit() reads the word past it.  A peer that soft-acks
without ever advancing firstPacket keeps the first queue alive while the
call goes past sequence 64, and KASAN then reports:

  BUG: KASAN: stack-out-of-bounds in rxrpc_input_soft_ack_tq+0x467/0x530
  Read of size 8 at addr ffffc9001363f848 by task krxrpcio/0/9662
   rxrpc_input_soft_ack_tq+0x467/0x530 net/rxrpc/input.c:959
   rxrpc_input_soft_acks+0x2f0/0x4d0 net/rxrpc/input.c:1014
   rxrpc_input_ack+0x6c5/0x910 net/rxrpc/input.c:1199
   rxrpc_input_call_packet+0x1db/0x250 net/rxrpc/input.c:1290
   rxrpc_input_call_event+0x16d/0xc30 net/rxrpc/call_event.c:338
   rxrpc_io_thread+0x534/0x860 net/rxrpc/io_thread.c:531
  The buggy address belongs to stack of task krxrpcio/0/9662
   and is located at offset 40 in frame:
   rxrpc_input_soft_ack_tq+0x0/0x530
  This frame has 1 object:
   [32, 40) 'new_acks'

Compare the base of the queue instead of a masked sequence.  The probe
detection also starts working for queues other than the first.

We found this with a syzkaller-based fuzzing harness driven by an AI tool.

Fixes: 7c482665931b ("rxrpc: Implement RACK/TLP to deal with transmission stalls [RFC8985]")
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
Tested on 7.4.0-rc1 (63fe746a609a) with KASAN, same config and image before
and after, with only net/rxrpc rebuilt between the two.  The fault needs the
tail loss probe to land on a multiple of 64, so the reproducer walks the
transfer size until it does and the rxrpc_tlp_probe tracepoint says where it
landed:

  before   pq=0x40 (sequence 64)   KASAN: stack-out-of-bounds
  after    pq=0x40                 no report

 net/rxrpc/ar-internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 865f05fe37ab..cdf5736d88a4 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -1580,7 +1580,7 @@
 
 static inline bool rxrpc_seq_in_txq(const struct rxrpc_txqueue *tq, rxrpc_seq_t seq)
 {
-	return (seq & (RXRPC_NR_TXQUEUE - 1)) == tq->qbase;
+	return (seq & ~(rxrpc_seq_t)RXRPC_TXQ_MASK) == tq->qbase;
 }
 
 static inline void rxrpc_queue_rx_call_packet(struct rxrpc_call *call, struct sk_buff *skb)
-- 
2.43.0

