Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680825;
	b=nXuk3L405AVVX5co1gIGuBqe+5p3nznp+WiUilQ10Kisz5bra0pZhL2k48Je9C/TlZMs
	 sSxFBfH2esE5HRlSwIeR6OtzRikutLU+/hW7dkg4LfsV5vfp+qig81S88Ry1cntDUJKQ8
	 dIXgRYmdTUZczj3GcLaqzBJaSMhFFyj8pazVe+ExN36cVLufm1X7zUOLpo8ZsGp/CL+TY
	 Cm356orKuk2jkvArRwXqdfO+6/FMqufs8DNt1vzIanB/epqCaQOBN75VLmyJckSizVE5K
	 KVMEFCZ78dL9nBvZUDRTZo2SfdcdM6n7BoNcYn1x2+HQ1br+V1yykcCcWhRRa6FIThg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wY251A2gFBhubMWNcVXXbFAamvehgaQIQBtTEHgzYqU=;
	b=Eyb/gP/YicF3U2aN7M3oPCKt5ouY8gE8holdlYVfIiwlHjddi+h7bwj204ZEoEvpzHNF
	 eaRkRlSm5W4TH50yd/vXms7M74RfuHfwicBCs2Sl2pdYC3UOg2YUniwv8vV1MS/J4sDuA
	 dVRGh5PhxeLy16uOgRJnf4bK1Ftj/3BnmCm2y/uQDIvFP8ynFVIbVtJMBgT3JAyGt0j8l
	 emZdop5mD5P4EteOHRCH1Le9PRene8KcB1xLJtbx8atXesZJIzdRhtXEXdC4Vf0S4wG4x
	 xGtvhmYxKOyvDxP4RQuPbDQWSQzKm0JKfTfdDrsSq9x+bbS64PZow+xX31eaKeRaRpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=yvlMw+ep;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BD8606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 18:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07BD8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=yvlMw+ep
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50a4a2132cso265293866b.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794680823; x=1795285623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wY251A2gFBhubMWNcVXXbFAamvehgaQIQBtTEHgzYqU=;
        b=yvlMw+epLBcR6QPndiDvtu/DP36Vb1I9QUbTpIKuK/eSaFrz4hPKBYlodY7mB/paEV
         SyqADJQf0UKEg794rHyYAWFgMnBH6Onb5c/YWmVNAZw5VX6t0kGEe76aTEQfHXyDsdB3
         4MQP8Vc/IOgP3UobSvoliqaH33yhxFsuUiKqp7frIuhMwFBHBs0e8IvOYP6ElvA9mTRM
         KuxJyAGnldcYP20eUad9KQsjFKzpKBj/thMk7nYmDGlD13IIsgQinFazt4+vSrPJhzRX
         q3vtBtLudd3jfkos86P+JehBMq8Wuo+XrSxzo5aBjR4CvPIKCXq91ooexdfg7y4I45re
         /Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680823; x=1795285623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wY251A2gFBhubMWNcVXXbFAamvehgaQIQBtTEHgzYqU=;
        b=EAoQfoVjOeJ+Nin5dx5rZKPW/ZosketbXWdWm0owDrdZlkzv11t+Ju6Nj6jkXEKR6U
         82DyE79ISzwpV/Ti2P3xt/RObTBtZGFGOIa3NIj2xvL+LKG/Tq7hKYve9htDTvu6+Xnt
         hHIS3H5XpJwduA6teBYnSLH3k2C8DvIDizA1mXziCHlfXQp+1eQdFOaIkh4mwzP0IRin
         wot6AdZVlsOLA8FJt96NJQ+S9zNYHnjsIYtgwVVBKByUzBx4QA7W63c4pnK14ytV0v+G
         aX7GHzIuJIO7AbE6z6ZxO7z1SjTheIj0t76ckRMNZfrYGNnApTm7xWaBs6ou8KJa34qu
         ZASg==
X-Gm-Message-State: APuU4Z/DwHZXown/F9FZI9c7buylhifI9rj6zxxD3hdyEGyKyj4xEYL8
	NnplD1m+LMnM2udg0/9D6JLDd8M5dpzGyrxaQkR6H7JN/MFd20iF9KGJ6wyA+UWqwWNwQttbZGt
	iuNfjdaQn
X-Gm-Gg: AYBFou1E5x/25mLDh7k2ahmMN/a7ZPv4DpkbQngRuRNljoM4WK+2sGu+IhpvJXfm3n9
	QCAr+6xexecRQ03gRKVVZFuz4fWadbS2IIf+n78OmzVrLtVY9UzkGZtOGst2XLfR9mZhbKArK3o
	qeZPK4RNblHmdDA/4FBnuFmJF2/UTIarqWuccr2VybMPqDR1Ni/qUhNNz1D4NZuqBzr7N6cyBzE
	/s8PIEMxZDOxCmkzIYUeSzbyZiRv47uFvebM0QYFRu45QpQmlwvJJrleNG5qYU8CHObcJa0cBpJ
	/ZyNUNj/eyJa4nDIoAEJ6cgr1XWBCly362QQQQnMdipewS2cvoeAr+9irVcaT5yGGyd9sAFmqrB
	EHYchLS5T+nGJhRh2jMOdU/Rg3DjU3Lbnwmh+InsR4NEK6BAeRe3mbqL4aqGQwQfkUypq5SEbYk
	eJemHCzR+3GzFbhs82j/g5/cTGXaJ6WRRbTeCKkxoQKPzjl+cQTOHbggryz558Yr1jvDD6xGz62
	71H3FjlpcxzU4iOm8mHY+qMlw6YMIK3hUs5NjS7qUBdQQ8rIHZIUvCh51I5++0o2otSbcOhGA4j
	UreoJi+pYuc7PO6zzRDf6+uAaSKKHKs73BWJgEYzba6OHFhbmwfqNWhYyQtMPVNVqiwIXQ8zw/m
	LaFDWRILh6mSfuEvZficLYvXUYYGeHNWFaIYPh5DfcLWZLUOqQJYawCB9nUBU+dFxWflEdSGvrL
	K0MTyJxKoXeOwyoboQ9I2cA5ImBxXDM176YfAMOo+zNlwafTG3zahpdtmbv/C2VcYPZstt9vqIP
	6w82G7Cvm+bpR53X5C9Fb1NTIH0KljKeZ+odtd53jKEcjsqCU4sxCwvSnqGreVsLQDbKxhGb0a6
	lBk=
X-Received: by 2002:a17:907:86ab:b0:c40:f89f:d91d with SMTP id a640c23a62f3a-c50963b451dmr480473366b.28.1794680823528;
        Sat, 14 Nov 2026 10:27:03 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm240086066b.4.2026.11.14.10.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:27:03 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	steffen.klassert@secunet.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	bsdhenrymartin@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 1/4] net: make room for the tunnel header in skb_segment_list()
Date: Sat, 14 Nov 2026 19:26:57 +0100
Message-ID: <c976a72586cda383b3e42486ee3d0176033b973c.1794151759.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794151759.git.julius@bairaktaris.de>
References: <cover.1794151759.git.julius@bairaktaris.de>
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

skb_segment_list() pushes each frag_list member back to the outer MAC
header and copies the tunnel headers in front of it, but never checks
that the member has the headroom. A fraglist GRO packet forwarded into
a tunnel and segmented in software then hits skb_under_panic() on IPIP,
and on VXLAN the copy writes before the member's head (KASAN:
slab-out-of-bounds write in skb_segment_list()).

Call skb_cow_head() on each member before pushing it.

Fixes: 3a1296a38d0c ("net: Support GRO/GSO fraglist chaining.")
Tested-by: Henry Martin <bsdhenrymartin@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/core/skbuff.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 8da53d5b76fc2..054983616f3e1 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4777,6 +4777,10 @@ struct sk_buff *skb_segment_list(struct sk_buff *skb,
 			}
 		}
 
+		if (!err)
+			err = skb_cow_head(nskb, offset + tnl_hlen -
+					   skb_network_offset(nskb));
+
 		if (!tail)
 			skb->next = nskb;
 		else
-- 
2.53.0

