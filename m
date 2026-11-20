Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191647;
	b=gS1O44rRX51j4dP24MciZ9TaV0WkKKHRTNuZWCzEZmwt2yhuln7blW8KXE5VYJ3y8BTu
	 1F8Dme+qdb3+AbvdNZ3Bo3YBrPUkZdHAwjBsq1+5WmbGMPdD5O5S3cdIaXahdpvRdk20g
	 qgdFNzDA9OYhD3gEBn48Ncl35j4U/vYoP0nWfEuxumiPy+9OkfMSbnpVv3S1h6qjCqGrL
	 Rmj7M8/cXREjg9+RxNqgn471oP7toVt2gHZ9VQMz6KJ2JXVKpuJHzNjmkFORnTcxuMkch
	 C5oC17AG9XfHUSv8QJ2NQPqPXAL/1pRGqRwsawBsVG1Q2CGUzVgM8FG6Vl+z+bjh7mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=oRxpEC2GG8v+kUysfDv1Clo2J6a3wzMDb38qxEUjywA=;
	b=3ZudlYMtD53edJv2RsGZ3fP+AdC3cnX1y6RnBmHyrnuIxQAqlbqh1xFM2Y9uT4QUU8Um
	 q0KHVXy4CtEOJBTj8SLNpozhGrUj9lRSI2tBveu4xHpUEZETyZY+cgYzw4cOsjpi79a/Y
	 LdpfGDzj97c5mahTKixtDrwNjIeoVJIW2NGQ3B+qTuzduhO8/nrEnJNCF5LY2S013Fn8E
	 pUo1nFDkY2sy/BXn/eFZT39LjW3tlEVeBG6SlCnVbmwpArEWgL1Z5sliU6ZHoYIxYv8la
	 l5SKhgq1TJ009nSDIlCjcRv8kw2JqpKlBVfbSB71Zt4gyulUD6/Nu++AwlGHc97sUhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b="m4SK/qcu";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A49606A33F
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72A49606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=m4SK/qcu
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b439e37813so267952a91.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795191646; x=1795796446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRxpEC2GG8v+kUysfDv1Clo2J6a3wzMDb38qxEUjywA=;
        b=m4SK/qcueYDr3XuCRqc7TgUWMwRcuhFcdHtQ1FBF9Zbdy4lQWhLf6vs9SK2vMlbqK4
         2dVtbe5YrdXbiV5wSQvitn9jj/ERoP4RArf9CQJZ8YCbonVWZpKLUIRSi3u4TPrVfSNU
         HCc053Mu7Kv9NA1DHUZOC/If/pZWqEwQbrdEW39w6o2Ymr0JveR0z1lnhmsZUuoYIpV3
         28XYNtgskHippdDC6wwaWV8uHljshF6bTNFuhro05DnVitr1CdD9kaXfFp3DziiMUwwT
         JqaWZ4CRsy+oPwwwyLutZ/RVdmHkUJXRX4fp4Owh7kPP3r8SWDb98FBqfxwpBLcSWcVL
         hCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191646; x=1795796446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oRxpEC2GG8v+kUysfDv1Clo2J6a3wzMDb38qxEUjywA=;
        b=sKu84P4qAVi6hKyOU59QZ6QpXnr8TIoUQAfMWhuG1mxv8wMcXoyR2ybnP7ps8EP+ln
         MpUV6kB3Dao/0aVsgojRPbn5SS5mcBpDb5ZkWi8EN06wSVpVwdY20+xKjuHrsEqfu8rv
         DXEv+W0ghRTnh7C4qxqC7I8rO3+drrNIZJOsvhE5q/muqJRFwmp8Av/+ooKSBL+QWqqg
         Be271yaIw1vYBcCAqh1H+D8SrVqjktucQC+Cqze6Q8IPTmmSwLQfUdwFiI3V3CqG2MG6
         rdZVWUVeq5NSjWwu8+OXUeilLE9BEm9QqGla7pov4kIjsOQcFoi5UB8y526hGJD/H5po
         LhxQ==
X-Forwarded-Encrypted: i=1; AL+hErEICnmPhsIU7llzDUQGmlZ7VZhWSvNDgm0S8OcLWRMa2t3lwI9f8/qVs+hlEokkIqpWffVsv3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z83cvET0N+E1C9sFyunDqBtMvyktjBv0QNG9iCTRRQE5FqKF1Zd
	eD/gISCVFDG3if7FNO4D5Lszuo+aJJMFkQkdF3kmSwgeNU0+4j3NhlqZ9CASaOjHdoD993cvbww
	gxD+ay3cGQdE6i+IjVLCHd1Vcu1uh7SwxnfMjr8FbS9mouYvvG9uQ
X-Gm-Gg: AZFdTZc7rNSMrGQNfAIMTURq9QIFcmKLv4LAcIbf7f18+1NkfV/luPrJtjyljIzqjyG
	PncM2QaLuTDkgcU26J6U7cXbQvXcZmP9cG/xbFrvsBR7wy3jfQPpqaqXealTvzwj08jaYrbQpP1
	McK3u1VeBLOYDZQaDeMXBJvXGm68WAHpotO7SqBpFynUF2FLl6SP+QqCDrwLuixFuhOYMiNAPmz
	07Zj1d45tx0aR+jsejA0KmeS5xWlLl+6GUwJnIQVEZaZWoiuqG6EDHYYtsWTOwDFU0G/+QSpzO+
	fRAidbn1q66MTCZRr4GvdbbZJZvF2fHvxiJ2jAFNKxbWXRHz9zdjaT03lJP/s+wYzaxbqYNCSgQ
	pYBbNpxwYFef0vzjHinQ/+nIVdKg=
X-Received: by 2002:a17:90b:4b8b:b0:3b3:b9e4:e3ed with SMTP id 98e67ed59e1d1-3b41cb47a0cmr3245756a91.63.1795191645728;
        Fri, 20 Nov 2026 08:20:45 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d66bsm3383925a91.4.2026.11.20.08.20.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 08:20:45 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	Piyus Kedia <piyus@iiitd.ac.in>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH ipsec] xfrm: iptfs: make room before copying a continuation in reassembly
Date: Fri, 20 Nov 2026 08:20:40 -0800
Message-ID: <d9a8310d-e139-4edf-9cf2-4b32664facb5@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <ac558468-8e5a-4b1e-8d4d-591221b2dbf0@suse.de>
References: <ac558468-8e5a-4b1e-8d4d-591221b2dbf0@suse.de>
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

On Fri, 20 Nov 2026 12:18:09 +0100, Fernando Fernandez Mancera wrote:
> This commit message is too verbose IMHO. It is quite hard to read and
> understand.

Agreed - I will shorten it.

> Manually accounting room and need allow us to perform a single
> allocation but I do wonder, is it necessary? This is a very specific
> case.. maybe we can just call skb_linearize() first and then check the
> if there is enough tailroom and perform pskb_expand_head() if needed.

Agreed. In my tests regular traffic (HTTP, ssh, scp, ping, UDP on six
NIC drivers) never took the second allocation; only packets arranged
for it do. There it costs one more reallocation and copy, but the code
reads better. The first version of this fix did what you describe. For
v2:

--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -909,7 +909,15 @@ static u32 iptfs_reassem_cont(struct xfrm_iptfs_data *xtfs, u64 seq,
 	    iptfs_skb_can_add_frags(newskb, fragwalk, data, copylen)) {
 		iptfs_skb_add_frags(newskb, fragwalk, data, copylen);
 	} else {
-		if (skb_linearize(newskb)) {
+		/* A newskb started by iptfs_pskb_add_frags() has little
+		 * tailroom after linearizing. Make room for the rest of
+		 * the inner packet before copying.
+		 */
+		if (skb_linearize(newskb) ||
+		    (skb_tailroom(newskb) < ipremain &&
+		     pskb_expand_head(newskb, 0,
+				      ipremain - skb_tailroom(newskb),
+				      GFP_ATOMIC | __GFP_NOWARN))) {
 			XFRM_INC_STATS(xs_net(xtfs->x),
 				       LINUX_MIB_XFRMINBUFFERERROR);
 			goto abandon;

Thanks for the review.
