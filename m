Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295671;
	b=hPZKQeEwAYymsqcbpYo6F9HaDyQRRyOvCsfG23dzH+vyswYfRl9lKWt4b76CpYahie71
	 FznPE0z+vmGair0/eSjrlxj53f3UkRTsnuhYT5nZLf4uEfng8Q1a8dcbJmu2eZg74h4t9
	 Zo4NKendmCDHxM0Vsp7fTXM/dl2IOZbc1WWrqWMn/AiuiRfe2SkhY95pZJL+jPAA3rrOY
	 t5VBhh6/Mxkm3PcJ6a19aUXH+au6HG6WKqMXeyfosHMitXIf3lI6IQTn00f1zaPuwDz3Q
	 LU8on+IXx3Tx5Ij/fu4QWUCcY3L1PqbJh6HKLzH8ZhL9rLBoj9VUbJwlevTB8XEI3Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tPyEPioH4Jqd4pN1l0cc7mDLDbl7A7P58myu0bI4FS8=;
	b=IK9iMtRJqivA6TpxlAGRcloEiGel15paq1I5Mut/JDmKtT87sdgSGdiYvn8QkyCdRdPH
	 mEcoy0vTuMdDoDcveSMfk9zQf6SUpRoXxjPd0P+j3Zrrw5tbJnKpCwe5xkbIbpzyRIlRc
	 eY0Xznuj0AKQ6IVzk+SQxwHl6W2ddroLxhNyk1NRPlEtPmivm1kxBz+mfO/7rmYqm+Bq0
	 qQYM6AwEon7NqaMcNSBwskTK0Xs2fwanA4ZYq18CrOnc5SAb941h6m1ynEutOvGRj6zcv
	 0xwHwICgEPZFXRAMDi5Mp9zT9rzFl4d7jfdYvCU+AhfoqmM+iALU30lyaBLBELIMdrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XXPipOwp;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32A0606A338
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32A0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XXPipOwp
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5118deebcfso305850666b.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795295669; x=1795900469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPyEPioH4Jqd4pN1l0cc7mDLDbl7A7P58myu0bI4FS8=;
        b=XXPipOwpwKOTh41KCNvW03A8lfp+hYkp1uvesj8Ku587olR6mkVlspov0uRRjrqw0j
         XuEqgjA7aQZsRJkeP606RJyNjih8q7w1pt+hX1JC36dwNuKqVrPvY67VWb1tnRqlKlB1
         gYSD+kZbAro0a9aEc+bW1Uu1B2odKopJJ+n/S1wbOnviuLkdkQcHwqKRnn1p/LZZ/V/c
         qUryFXt4FdleXRZzwV4kA4L97YQ50lFebYoXusUWnYDvG9FDr2cK7JpCGz+rDpKNpmKI
         0jUxGJn3IjSxRGpmcTylPB7M6xVceqZYIVe+19q3YlBUmMan+uvTz7MgYYNZbaBZQM03
         ujPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295669; x=1795900469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tPyEPioH4Jqd4pN1l0cc7mDLDbl7A7P58myu0bI4FS8=;
        b=O8nxnC5apb5V3DzrLJoFetn+FUtlj9ifPT2eeLv2nsbzkQnTKaYhXhH8mpiqzF2pIo
         4NlipoCtIbpFKVhYAm6is8fW+ze3lkW+Q93dIM6GxuGpVraZnN7+YVnPMEaoUaFEWZAK
         2hqcusgcuWoZj5bYqaLuQN4WRw8q4Q7hGVw661DG+F8xCCFymRR1jC7xmT0SrEdj0C0z
         +fCABeJPDc1joZpEm+uFiNXrmQVp7Q1KmRD0WWtlhAYpX/T3yTKhmDpUcVRuw6zZrHXc
         sU01joEtEbaArFc2pu5+yzxq1QZtq7rFigX2l1+rJXA8sQ3AZP2HKY0CoykZqaNPCAs/
         8C2g==
X-Gm-Message-State: APuU4Z//uDaS6erBvDXcfK/aFsIV4T+3LPo/Y+P6B7b62FzJIIcMEtV0
	VS7bVb1l0IN/hDHeNPl9Y7rgX4NBL2wFP3ez7HZdyDxYFpSYZzZFw17d4y0ctRwrd3M3e0o8RFe
	jayg2T4Tm
X-Gm-Gg: AZFdTZdDH/qjMhpsoVPIwW1+enkladk5KlbdCeoo+bqb/c5aN8KJgQOwqbNQyLgLWe6
	JnLBPyw71k8L8gsstK4tJBYCpeGZczll9WxCCI2vchEKkQAJuTBZ9hVQDx1yAZVK94Or80xXXz1
	L5ccz+PkrbnAi8tjLsHpsS/h0jyqj4o15vZkgZI2HUrnky4YQtSaFIzhDC103JNEbr+jKTs2j0g
	uxfDbGvlvM78bU1nuZ7wu2JMaXAS+gapb7NT3hX+to0cg8/L9HjBExcNkvvfZQa4PYG6Uz97eBE
	PT/EXm069HSqlvXJ6U+KovHYULDjsf54TQPGsA91P61lJ2fJNcgGSfXuuYKcovDpwsPvLc7KcHj
	9HMLAIp4MbWiBBnDY97ShUyKqR/zWBx+9i3YQ6WEyhr9OhcyWxscdzVzJIRCVL/zN7VhHjXEQnl
	BUOSXh7QOyCd8TTr20Q/bjQSRxXW6oS7khYZoyvXnNRb02LNKShMetewnX+I1U/y3zRkuZas7iS
	pdWoNBNe/YpH/xhBkgortgSFUfKq0JJDmjxlsK7Ztb0nQ06XWx8Fgz/MyNJomU/eUIvv13lZ4Yc
	83VPpH2ISM8Uym8j2wVodtsZAwMbNwiULxsy6TlG6rp4YnL00X+R4076pCjQqSELDAv+KAK62FK
	sOVgzKtag/1Ha5wbQp8yJRJAyBMITj48y7LDu+sYiZTshetfyRCQoCK/s8CjGS/QyP0T0KSmZZa
	FyT5lzqXl/sXiONTlQAWtgmiGtfxcCKR7pdToJwX7KSYIWWndGJNQZ7BgIV/oomYtcuGFPj0rjC
	56HbG26Ye7HwLNra276b8KLOIQT3VR6Bdrj1WsSd5MXEflrDE434Jh27lGzHEoiM6gZ9drBfAOz
	gl5LmVZu+ZM=
X-Received: by 2002:a17:906:7d4d:b0:c40:80eb:c54e with SMTP id a640c23a62f3a-c513a47e0c1mr487573466b.4.1795295669169;
        Sat, 21 Nov 2026 13:14:29 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([113.30.183.63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm233079566b.87.2026.11.21.13.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:14:28 -0800 (PST)
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
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	nbd@nbd.name,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	bsdhenrymartin@gmail.com
Subject: [PATCH net v6 3/5] net: gso: count the inner UDP header of encapsulated UDP GSO packets
Date: Sat, 21 Nov 2026 22:14:20 +0100
Message-ID: <25682585bdc914eaba2f9c5ee7473722bb2ddc10.1795295554.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795295554.git.julius@bairaktaris.de>
References: <cover.1795295554.git.julius@bairaktaris.de>
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

skb_gso_transport_seglen() adds the inner TCP header length for an
encapsulated GSO packet, but not the inner UDP header for
SKB_GSO_UDP_L4, whose gso_size covers the payload only. Every segment
of a UDP GSO packet in a UDP tunnel, built by UDP GRO behind a tunnel
socket or sent with UDP_SEGMENT over VXLAN, is counted 8 bytes short.
ip_forward() and ip_finish_output_gso() then let DF segments that
exceed the MTU by up to 8 bytes leave unfragmented.

Add the inner UDP header as the unencapsulated branch does.

Fixes: ee80d1ebe5ba ("udp: add udp gso")
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/core/gso.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/core/gso.c b/net/core/gso.c
index b5bd269e56e4..eb95c9d2819b 100644
--- a/net/core/gso.c
+++ b/net/core/gso.c
@@ -156,6 +156,8 @@ static unsigned int skb_gso_transport_seglen(const struct sk_buff *skb)
 
 		if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6)))
 			thlen += inner_tcp_hdrlen(skb);
+		else if (shinfo->gso_type & SKB_GSO_UDP_L4)
+			thlen += sizeof(struct udphdr);
 	} else if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))) {
 		thlen = tcp_hdrlen(skb);
 	} else if (unlikely(skb_is_gso_sctp(skb))) {
-- 
2.53.0

