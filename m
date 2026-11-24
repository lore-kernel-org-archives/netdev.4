Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539960;
	b=AiSeuF3B4Y1ZamCZdIU8TQasMm0glMF0n2Rlh9RzcHViX5Xjgeesrk6sAfCyXSCt2IF5
	 GxXOalUAICfjFzmV3HAjdfqbb4GJVMv9pfSxc8wZ0dhTWpOUzAJIUoVZdzi3qlhu0hZtO
	 2Suk+GKNsJYG7YQPmyciAVp0mBi/FKscfSrWQnf485lQmQ3tXBqL5xGYu2c5kLYJmWcgw
	 nBZNgDNBviQTMmC1jWJP3C0HSPn1M3PVv52YvKhT8/mGkvizS0Dq4rSnXbd0aedy0Xtan
	 NniSQiJnHv+Hn0LImhtd2M+/Qr/cVReES3eOiiLJFFfqYSpPOTXWS8Za4Q96LBAqD4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bekQiOXnfiyxOSn8BYOsnxdsmH46tz5CttYL/JmwyFI=;
	b=kZBrvsoHVa51L+THJQNX5YkxbLI5cilJqXXUk6qhtePcGNo0ca+cDI4ysGyMcus5NxTK
	 FGUIIIA9+yyymY5qLS9bl5Idv9XPktYv5ZtejcSMyko7g/+dZ2DNHG5JcAgGoQUX4Wc2+
	 oXFke3Gu14H3jcpXiSKhZZ2FTz5evIm5hX8R1miJjnJZAvg3IGK5zHI37/41/Uj8Unvac
	 Uu1/sjBRzWvWsof/jvQ+9/aU84vdniwfrEHaDf6OQ0u8Gwqz2qpayUr5efR6Q6iO91baS
	 /v+4jniV7Z5aEEKGZp5SnB9qpPv+wf0Bots8H1F4vMqKeymubjAolokuQAzkc9eCIyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lumzv1dd;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90AC606A334
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A90AC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lumzv1dd
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-921367ef6b3so33953956d6.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539958; x=1796144758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bekQiOXnfiyxOSn8BYOsnxdsmH46tz5CttYL/JmwyFI=;
        b=lumzv1ddr2IT/3St1fFBzGSf7X9aSrhp8J3jgSRqGNmyclO3vnUeSr2wulRynyAjD6
         tMymZ+miukBLSRHqj+Bzuei5KjkChJNQxjNERvzsF/vPLwO7y+fk/BEIFMQf6NkOGyoJ
         ltOVQfzFhunv2uJ9Wwd0FK6M5541wCHWMNbc7t5Qkt68pTG86GFaksjBj5Sw3lFNVzkO
         nmxIIVn832EdWpbMt+2Q68WjzZUnfbhhStEwefb0jd85X+DXljcMLGRykznJU/GGbLS3
         jcr633sJcBvnr3hdSPoT+xrsGRcemPEk3gf3PcRYUnjO7e4Cn7Qa8KaWsntnKTDysYPQ
         7/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539958; x=1796144758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bekQiOXnfiyxOSn8BYOsnxdsmH46tz5CttYL/JmwyFI=;
        b=s0YhixI8OM73NfFZ7zL2OiuyF6GYWtAmbNFbNSR8fgrNQKWC9pZkvGGRBp+fOwlZS/
         Whoa/sg3qHSYLo3J8wyhuzja8hNBNtkdgtO6bvX3fvX7eS2+kL8gFltFl8Y69UMJd+e7
         wYQA+nGjstL3mMootWDQTqjbGWejtoh41HBNLA6/U+X9pkgAZHNHNWFIk/EYeoSlLDMn
         3PTfG89UydS1cVV+ooRZGbZJwoIyD7USGpTVcAQTBGC16dbtnQcI4LdrfaCqfyFJrT5W
         NWNeC+oEeuxD617xO2CAE98l7yMUXmnFzqAAEJy4WGmck6v1jKqpBzcB09waT+kTsOij
         9R5w==
X-Gm-Message-State: APuU4Z9h0tK0U3FzL2wQ3Y7Ee49NqOiBhATw6gUAJUJMhKMmLHjAraV4
	Zrwt9XgGPGFNdLVlIusb+xA1kTzv1oxhZD3h19qoQrDNSAZ2J+wtY/pK7Kjj2g==
X-Gm-Gg: AZFdTZeIAhnT4Vs17uw6U8zGXkx0ETwPiSN5nGCjCmLBQ6xIZa4ixtbguRIu0A0p020
	5EyeAoTsi86VtP+ivhgHIEkFM3OOWF5xi08apAu2M/r8AyMQurj2s7B4Q4PZdaByDIVbEeW42v9
	kp2EmwOUzBKXLfw1q5wib1AmGHAO6OHcYE4x2m8B34VvQb7yGb6ME477W2HsXpKwX/YBQ3PfI3R
	sGPF+GuPxKL9c4XhOCO9SV2AC4KMkvq+fJexHLLrOeMdCbfmYuQEs2oCBlRV3zi8cLMnBStn2IQ
	luttYosAFxWajKjOLAgQTo3A/abhjSEj7jgZbpVALbwZpV+MRe55V7zIlo2anVp+k7OAss6FfTT
	0qhmJ9FyGOm3vPwgXV/EXMVEMj+OoT8rMKIa5RaInL+chEGrY+VX6+0D8iSMk2FV/5J5YD+IdYe
	RwsQAXsBU6Fgng1tNpWNl87NyOsPM0OM1OePXyW/eVvgO7HROFsHoaiJo7E3OeCpZNeZGCXmZr1
	MOpXEp0E+/+1UN4YQrEMWY7OmXVG0KnT4115oSp5cwvME5goSPjCOYvuyviqidKleqGne0RbbJF
	V13NfCVBl4l5cYp3FMZIZH6QvYeHG3tsj+PqAM98a5uNN4skr0yjNrxBSdnpX0H/FsEc0RGLj/D
	DZOkHx+0h1e6vwTkjvq9PJ2jTFmoxRRjyrjnfhsN+f87JSRq+1qMvXmpUHVdxEuCrHHBAzqmKbU
	2wXASNadKXTI8=
X-Received: by 2002:a05:6214:6286:20b0:921:2f46:6c7b with SMTP id 6a1803df08f44-92134aa0a9bmr213559116d6.26.1795539958475;
        Tue, 24 Nov 2026 09:05:58 -0800 (PST)
Received: from willemb.c.googlers.com.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cdfbasm140078216d6.17.2026.11.24.09.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:05:58 -0800 (PST)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	elder@kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next 3/6] packet: validate TX header length before skb allocation
Date: Tue, 24 Nov 2026 12:05:41 -0500
Message-ID: <20261124170551.1874487-4-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
References: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
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

From: Willem de Bruijn <willemb@google.com>

Now that dev_validate_header() is gone, TX header validation only
compares length against hard_header_len and no longer needs the copied
link layer header.

Simplify packet_sendmsg_spkt(), tpacket_snd(), and packet_snd() by
validating against the snapshotted hard_header_len before skb
allocation and copy. This removes the now unreachable len < hhlen
network header reset in packet_sendmsg_spkt() and, since
__packet_snd_vnet_parse() already enforces vnet_hdr.hdr_len <= tp_len,
the redundant hdrlen clamp in tpacket_fill_skb().

A too short packet now fails with -EINVAL before, rather than after,
allocation and copy errors (e.g., -ENOBUFS, -EAGAIN, -EFAULT).

Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 net/packet/af_packet.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 230b16742346..e8326cade94a 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -2024,8 +2024,13 @@ static int packet_sendmsg_spkt(struct socket *sock, struct msghdr *msg,
 	}
 
 	/* Keep the allocation-time header length across retry. */
-	if (!skb)
+	if (!skb) {
 		hard_header_len = READ_ONCE(dev->hard_header_len);
+		if (len < hard_header_len || !len) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
+	}
 
 	err = -EMSGSIZE;
 	if (len > dev->mtu + hard_header_len + VLAN_HLEN + extra_len)
@@ -2051,8 +2056,6 @@ static int packet_sendmsg_spkt(struct socket *sock, struct msghdr *msg,
 		if (hhlen) {
 			skb->data -= hhlen;
 			skb->tail -= hhlen;
-			if (len < hhlen)
-				skb_reset_network_header(skb);
 		}
 		err = memcpy_from_msg(skb_put(skb, len), msg, len);
 		if (err)
@@ -2060,10 +2063,6 @@ static int packet_sendmsg_spkt(struct socket *sock, struct msghdr *msg,
 		goto retry;
 	}
 
-	if (len < hard_header_len || !skb->len) {
-		err = -EINVAL;
-		goto out_unlock;
-	}
 	if (len > (dev->mtu + hard_header_len + extra_len) &&
 	    !packet_extra_vlan_len_allowed(dev, skb)) {
 		err = -EMSGSIZE;
@@ -2637,18 +2636,14 @@ static int tpacket_fill_skb(struct packet_sock *po, struct sk_buff *skb,
 		if (unlikely(err < 0))
 			return -EINVAL;
 	} else if (copylen) {
-		int hdrlen = min_t(int, copylen, tp_len);
-
 		skb_push(skb, hard_header_len);
 		skb_put(skb, copylen - hard_header_len);
-		err = skb_store_bits(skb, 0, data, hdrlen);
+		err = skb_store_bits(skb, 0, data, copylen);
 		if (unlikely(err))
 			return err;
-		if (hdrlen < hard_header_len)
-			return -EINVAL;
 
-		data += hdrlen;
-		to_write -= hdrlen;
+		data += copylen;
+		to_write -= copylen;
 	}
 
 	offset = offset_in_page(data);
@@ -2878,6 +2873,10 @@ static int tpacket_snd(struct packet_sock *po, struct msghdr *msg)
 						    vnet_hdr.hdr_len);
 			has_vnet_hdr = true;
 		}
+		if (unlikely(tp_len < reserve)) {
+			tp_len = -EINVAL;
+			goto tpacket_error;
+		}
 		/* Prevent the byte count from wrapping into a negative errno */
 		if (unlikely(tp_len > INT_MAX - len_sum))
 			break;
@@ -3086,6 +3085,11 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
 	    (len > dev->mtu + reserve + VLAN_HLEN + extra_len))
 		goto out_unlock;
 
+	if (unlikely(len < reserve)) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
+
 	err = -ENOBUFS;
 	hlen = LL_RESERVED_SPACE_EX(dev, hard_header_len);
 	tlen = dev->needed_tailroom;
@@ -3115,7 +3119,7 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
 	if (err)
 		goto out_free;
 
-	if ((sock->type == SOCK_RAW && len < hard_header_len) || !skb->len) {
+	if (unlikely(!skb->len)) {
 		err = -EINVAL;
 		goto out_free;
 	}
-- 
2.56.1.839.g22a8290db9-goog

