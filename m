Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195811;
	b=0eZ3pPlUXwC+9nN2DJb3qghGuxiWj+nv77T6N9MsZnDqK4ztLM7ASH9E9dl+pdQFaXUf
	 c7xRmns7cv3bnDUkAskf0nrrDpp5c3yEXs2W0cuW3Ea2b0afSfjtOP6/B/Y6A3KNwUkb2
	 58B/ZyJXDY5RKByfv7ejAVNJKJd8YM0day/k7KBrGeqxW1Pvd0pNfacCzKeSVQqJw5KeL
	 wegGyFiYBJzfvzhIHh0IEj7Ttdj1tiAJ4T0E4IZuZdfdnEWuhH4No5YwhpkkOWtEbzCx+
	 eUW/P0HHrv26crh8Qs1uCiTjOcf+JWm5micdB3BWfe58lSEsJmw5aPgdFUSvsAVuxLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195811;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=qdMPH+Pywn5lGv8FkAdtFbl3/Eh+8xCXy0s9sNtd2TE=;
	b=eX8rLO6V64H5JoLddju2EQ90ASsVZvJtFXaMuAGtcgNGUypxAuUPd4pUdneg4r1cLU/N
	 02HLuqMluFwfnTV2m95W+HcHIoW/ExqU7sVHhpDWImI0kGVMEAOhcnx5nATGBr/y1s5H/
	 /TXzMSXlaHyGIfVK7HG8a98TcphGXF1GYtSyjSgBUVSY/amSSXEYwYcmATrDW5QpWJBNE
	 OZxL7kjkxL7haUcUAcCdMGvv6WtrFh/L4z1EZltIUAwOMvcrr4NTk8CTqqfeuQQ3xH7hE
	 uXgDcdnOGJAM5miuyF/XjIRrC8tv4jTnlp9Ltjc8V+FU+dspy79tWnSewU1qPUSIgmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XDmsasiE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9BA606A332
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XDmsasiE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E581F000D0;
	Fri, 20 Nov 2026 17:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195810;
	bh=qdMPH+Pywn5lGv8FkAdtFbl3/Eh+8xCXy0s9sNtd2TE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XDmsasiE5fn/7NbVNu3tKuaceDvOyCzLzEokGxtlnTHOqGD+mA+z/B5sPDKquEc7e
	 erZcEpiF6ZMljeZTtlt7WAAiw6oxlOCkevuV/Qi1E+Hg8ww1U6XfX+M4+BdHQ8cJkY
	 nMvUlqITp7aAC4hK8jQDlZ0zv36lCrrSuo5bVx3v4N8Bk7LdG1KWN4ha8Ns2KhrGdp
	 xG1XVafCN0BS8tconZ9FjgxVPzPb/tkJsIXRUDzOdqfWjXHcOLRGZCjpj0/IqR/ACA
	 f+SrfloBbh2tdUCnw4wJOgQH3doJk+AmFIUIm/pUinueniwxJ3s25coKi05PadyXZs
	 SL4pU3mUytfUw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 18:29:31 +0100
Subject: [PATCH net-next v9 12/14] net: ethernet: cortina: Account RX
 buffer size in truesize
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-gemini-ethernet-fixes-3-v9-12-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, 
 Myeonghun Pak <mhun512@gmail.com>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

gmac_rx() charges only the received payload length for each page fragment
attached to an skb. Each fragment pins a complete free queue DMA buffer, so
short packets understate their memory use to GRO and socket accounting.

Charge the full posted fragment size for every attached fragment. The skb
already accounts for its own head separately.

The issue was found by reviewing the RX fragment accounting. The series was
tested on a D-Link DIR-685 with media playback and ksmbd transfers under
ping load.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/ethernet/cortina/gemini.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index fe23ef8be9e5..5f8f220ad9d7 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -1907,7 +1907,7 @@ static unsigned int gmac_rx(struct net_device *netdev, unsigned int budget,
 		skb_fill_page_desc(skb, frag_nr, page, page_offs, frag_len);
 		skb->len += frag_len;
 		skb->data_len += frag_len;
-		skb->truesize += frag_len;
+		skb->truesize += freeq_frag_len;
 		frag_nr++;
 
 		if (!(word3.bits32 & EOF_BIT))

-- 
2.56.1

