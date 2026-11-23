Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401329;
	b=hwWqd2EQww88Nyr/axfe/RjGHOXIhbZGSiyXDA4c59bk2ryVf/2AJrNpawozx8UTyvj9
	 L7RxV8Z/ifkMEJNc1Y8QK/CRpWGLPnCVijv258g+5OR5tGIwZjA2NAaasJvj4IQrAnp8T
	 a9yT1LpOqGKbwtKHhFHqypIkGVSJ2wGw15O2mGDQP2FiMp1btT8e4gElCc4Xv52lLFNig
	 /h8bfQwfsDGNud2YJUkJnv3dfPd1ZqAlpDJnZPvMt1/B7NhW/dmFlfzp9D8ZiahzWFkSk
	 g/UqSB9ay0nEY6R81dD/cW3XCYubRF1pEGr1D+Ogx37YFlTpngScpiqKwmSxCxMGTNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V9tZJEHgi9zuzkPjoAHZgtifbl5VP5I7TzEdZTDXpvA=;
	b=YiHJkG9JmQj6iHxx9+543LmX0bJyupS9MjASYIjFGxrrmwY5nqDG1phxMdKDZS1mTFuq
	 pSgrBQBoetoE2NkUIfHSYmS1ScUW7Xyfs9kTyNNVsXxtGbTX8cCweag/exSSTWuKKZBq9
	 ZxnTl0Zps/tIW5BS/Rmc/90iYsvAn0OWV1CHia+5dBFQXryaAo8Ov12xIgBkgXhHLBG3q
	 x0VVRf+YOwdx0VaFB9Puvv9V+H4t+HlvLhmPeGSmVTPTwNVV4lROI5Ate/SsTu5lVqGQt
	 bNEyUIANxMidY0MmNCGMnVBpMdL5x2uXYdJIO5on8LQ7EcxNN347BKoUtVs6UHrjYNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b="VvB/gHVf";
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C15606A331
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C15606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=VvB/gHVf
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f0464dd6b6so14777555ad.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 18:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401328; x=1796006128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9tZJEHgi9zuzkPjoAHZgtifbl5VP5I7TzEdZTDXpvA=;
        b=VvB/gHVfJLWn6n5wEIFsFijRGKd7mKTFlb2ToYtj8fFMD51k7tp2A48f3VANoQ07mZ
         qkdVQuiIdId4E/jI9cpMSUeTbqqsxUpcRscDfxi1b8GbGBsheFytaVRYCqPNTCzAUSiH
         PzLCLsWBU7/Um0FX04qV7WyQl/abRPSo3MzGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401328; x=1796006128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V9tZJEHgi9zuzkPjoAHZgtifbl5VP5I7TzEdZTDXpvA=;
        b=Fy/hSmuBbGQcfiaTCIxmW90ryM2LBDVNN1IiY00ZpWUxKlYL1Is3T26j5/WLtlxldi
         wShGbDae8YbOhlyRT/BmjCBykcfWRcol4QhUWRU3pEOuGZHXB7AnUfjcfbx1WmTHi/Fm
         wicKZK09Fde2yOcMrjygwhduPp7jESIwK4QGQ1oQJKlIUgvVjJVegdV/fJlMw8/92D7/
         ezVp/tfp5MMJXKyYmnEcabp0+IvgOmPOjFqsFyrjHz6CtYk/pjAh8vf1UBLq3x3mvy1I
         3602bCdNdA9muLGTBjtlZHHOsiG6Rr7QwNjjOwpA0kspkfFdaK3Q3IkF6Wc6K+F5ysxP
         dKNA==
X-Forwarded-Encrypted: i=1; AL+hErE8Z+spI/cPp6YUrW3H+rrF6ujbodyAom6IN+QfFCRTNP5S+oCGe4Nm/ijoyrARrh9uDlzbf00=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z2lRyxYJM66fSkCv8pHRiWjecaoF4iZgzkgWywtkMLoPGrhSN
	b3kWJMNiWk+hzNY9wYeLLKuswcDFg4IlxgfB7zEG5Vqu5hnv9ld4X944gOGxnlfZy6I=
X-Gm-Gg: AZFdTZdXRSaTQhmO2xu74FAJvYVgT+GQqpJ+plDckRUeOVxg3QJ/KvmmzVZSPxo/JYR
	Vc2819wONc5NEYxo5QWDdVQPbVoPkgXSD6/PjeSckGJjfsOnmduiqSG3GPKqc74na3k61aVheOh
	3AcO1A2zAfnFmNu/EyUkmZWCBZdS4Jmd8+N/TL1ZBwA1dFrXoQbtUAAyXpHiaQaQzbUvw8+jdlU
	QQTFcw9qhdPJE5WmtYv3N+N/JpPmJ71vL6IU/YHoxoBXqcW9BGNVcSEHsoopfAGLIJ6PZP0D2V1
	DLFSxFi+pDTIiUJcxlx3J3g5bfMcv7PjpZVRGXIiPN8n8SNSfjHetualg0X6/dDmX5RGibkmF5b
	cv57Dob0334j+BoxaVHwCmUIoYZowJpK8A72iowJ/TNU2y/9jSyBjetmGKaU0C59cNqosmwubB3
	eybad6IXDe5KBS/rrUlVgRgtfRx07Ptexv4HAulVtNt54roT0hzbbcwq6C5O8ODobnJJnkd88KS
	GqmINe21f4wu1ZWDFPFoHrsXe2iJLCV3THCGhz3Zoh9LdQ+Byp/7Jq/tAik5ArRmzibOArfS/m6
	rDKYYlnhk0p9grrzQZ4IlpYB32M8EKLi0tWT2SJcQXYrPlao7t8xs8ZcqeDRXDsL+Xc1OItfbTF
	e9oINMY4zd/6cgb7pPrtJ5Kmv21FIZSbz4rzv4BAKn+kK7cjDqTOrZL1XeQY+A5xhUkmhMdxH7W
	xLILwLdFH/iQ==
X-Received: by 2002:a17:902:d2c6:b0:2ef:f312:b842 with SMTP id d9443c01a7336-2f03f1b426emr100861095ad.46.1795401328203;
        Sun, 22 Nov 2026 18:35:28 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm44320685ad.63.2026.11.22.18.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:35:27 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net 2/3] net/nfc: llcp: take the skb reference before queueing it to the socket
Date: Mon, 23 Nov 2026 08:05:19 +0530
Message-Id: <20261123023519.3350997-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123023519.3350997-1-piyus@iiitd.ac.in>
References: <20261123023519.3350997-1-piyus@iiitd.ac.in>
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

nfc_llcp_recv_ui() and nfc_llcp_recv_hdlc() queue a received frame to an
LLCP socket and only then take the reference meant to keep it alive:

	if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
		/*
		 * UI frames will be freed from the socket layer, so we
		 * need to keep them alive until someone receives them.
		 */
		skb_get(skb);
	} else {
		pr_err("Receive queue is full\n");
	}

sock_queue_rcv_skb() takes over the caller's reference and publishes the
skb on sk_receive_queue at refcount one, so a concurrent recvmsg() - or
the socket's own teardown - can dequeue and free it before the skb_get()
runs.
The increment then lands in freed memory:

  refcount_t: addition on 0; use-after-free.
   __refcount_add
   skb_get
   nfc_llcp_recv_hdlc
   nfc_llcp_rx_skb
   nfc_llcp_recv_agf
   nfc_llcp_rx_skb
   nfc_llcp_rx_work

  BUG: KASAN: slab-use-after-free in nfc_llcp_rx_skb
  Write of size 4 at addr ffff888055abe5e4 by task kworker/1:2/56

Both handlers are reached from nfc_llcp_rx_skb(), and the aggregated-frame
path widens the window by dispatching sub-frames through it in a loop.

Take the reference before queueing and release it again when the queueing
fails.  That is the ownership rule the rest of the tree follows, including
the raw-socket copy in this same file:

	if (sock_queue_rcv_skb(sk, nskb))
		kfree_skb(nskb);

sock_queue_rcv_skb() does not free the skb on any of its failure paths, so
the explicit kfree_skb() balances only the reference taken here.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was then checked by hand against the code, the fault was
reproduced
on net.git main under KASAN, and the patched kernel is clean on the same
reproducer with ordinary NFC LLCP traffic unaffected.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/nfc/llcp_core.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf81700..e988c95cc 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -922,14 +922,16 @@ static void nfc_llcp_recv_ui(struct nfc_llcp_local *local,
 
 	/* There is no sequence with UI frames */
 	skb_pull(skb, LLCP_HEADER_SIZE);
-	if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
-		/*
-		 * UI frames will be freed from the socket layer, so we
-		 * need to keep them alive until someone receives them.
-		 */
-		skb_get(skb);
-	} else {
+	/*
+	 * UI frames will be freed from the socket layer, so we need to keep
+	 * them alive until someone receives them.  Take the reference before
+	 * the skb is queued: once it is on the receive queue a concurrent
+	 * recvmsg() may already have freed it.
+	 */
+	skb_get(skb);
+	if (sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
 		pr_err("Receive queue is full\n");
+		kfree_skb(skb);
 	}
 
 	nfc_llcp_sock_put(llcp_sock);
@@ -1136,14 +1138,17 @@ static void nfc_llcp_recv_hdlc(struct nfc_llcp_local *local,
 			pr_err("Received out of sequence I PDU\n");
 
 		skb_pull(skb, LLCP_HEADER_SIZE + LLCP_SEQUENCE_SIZE);
-		if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
-			/*
-			 * I frames will be freed from the socket layer, so we
-			 * need to keep them alive until someone receives them.
-			 */
-			skb_get(skb);
-		} else {
+		/*
+		 * I frames will be freed from the socket layer, so we need to
+		 * keep them alive until someone receives them.  Take the
+		 * reference before the skb is queued: once it is on the
+		 * receive queue a concurrent recvmsg() may already have freed
+		 * it.
+		 */
+		skb_get(skb);
+		if (sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
 			pr_err("Receive queue is full\n");
+			kfree_skb(skb);
 		}
 	}
 
-- 
2.34.1

