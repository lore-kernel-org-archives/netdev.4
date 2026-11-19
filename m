Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131981;
	b=HXdvF5iFL/3efmy17QsgPBSMlN2y3hpbPt5/E7qJQQKSbW2sY3pEJLW65KAA810OkCCK
	 RdpASnwe+2mmRsJND2yEPVyGc0wHSH2np7/S2H5C4DxkUojZH9/L4PdltOKrNnYnlJoUg
	 t08lNQF+TdGcy7gI95tdeIe5f+2GmDiwuiJfCCeWmy+ZXGIkVsETF0y4TWXtNeip/Ungb
	 KiRaQ5e/9MfPlzIMmkfD/OJgyLtOzDaR47JcC4x1Lo9ncYdu5Kfve+zHNlR+N2bv2ttoi
	 TyJv5unA/a1jI65dxxIBL+VMvuredBGdU7RXar9JQ1Lmw3wP4c3fRjmFH3fWYresj5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=O4Ot2z4MCcgdabWEIOtlZYlPtAzxWg6EIHmWyQmyBqA=;
	b=NmdtXL+hXezuPeiva2NTQs0x41CMqmcm3XIxIKimPxEnH5/bN53JvyskKDAF6HwXb/Aq
	 jYYMuvRDCCd5UZoKR6/l51OfIa8zKCmsdtCtN2SwprXHOEeavoDqlhnmQz/Uah2IYC/m/
	 ex0BmQ3G6tQy9deTWSdRBzDQyy1aGCW5zukBTTwlK84hYIzxkAjDWH5u5Cx8qauPEaJ2i
	 aOSyrDG01yWumwEm0x04IR3wnaXknUhBUpnWWlWRg20gYj13OC42o6vd/eKHNVXMS7dmU
	 pIG/GwoU1gcOL/j+m5Sw/vtOEBo6qfIC4eXnJWgy5t1+mYhQld9aXcS0Gb5PNG1yESA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6ySQdeP;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8945F606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8945F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6ySQdeP
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2ccd3c7a2so125805137.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795131980; x=1795736780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O4Ot2z4MCcgdabWEIOtlZYlPtAzxWg6EIHmWyQmyBqA=;
        b=k6ySQdeP1D8gsoT9JTc4uwnuXJZDLesE+lstQMI60m/UxbS6pBBuGZDpL6XNARNsK5
         pvtY1DGJ091E3GkhLXlTS7YaarwJQdnJG6vn2qB1S64WnB7oSNziM2uNRx2PZ70/NrcD
         XgXYbdDMDNr3MXiZL8Y0kEsdML+oXcUxNLBAAHTP3VpXk2dgqaaYIXVCGSkgYCTtu8ta
         +7dWFwBY9vld+mZogFVX+7T9YpSSN1Ob6TbaM1HPDCOtJsQ6DBXgK3Yv+lLI4KYJXCWv
         YhXC4JG8cRwQknZny5385xwQAWpeoiIKVUUFqOWztDBirQ68hO1QlqtwlXJbo7NpStM7
         oEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131980; x=1795736780;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O4Ot2z4MCcgdabWEIOtlZYlPtAzxWg6EIHmWyQmyBqA=;
        b=fJ48ckmLxfAVX7jEdDijQLk8/FWzp6rUC8SkRvOkGr1ICbe3z20kEccMF3/5H5sfsv
         Qae1LRObrJIPSUdASdADk5Sybiti9+59E1QJ4zKWBtmiPEsBjqaffvLSsSDw645dzYyq
         uXAl99kUW7XDl3EpRDBMyAimse+0sx+solc4y2Lj/jDq9nump4rwZ/ydnRZyze1EWrij
         YRGIstfxmqLLClzOM5jitAy+FB0eLQqJWYZuNp1plPgBNl4pSlulfAlELCJ0P3jNUyzI
         JLiUoNRDCs2nNOV39glFMTWg5WKujunk5j6Mox3EnG76i/N3ISzmALQVaft4qlBRCv6P
         QSfQ==
X-Forwarded-Encrypted: i=1; AL+hErGU03z62AVm1ZN4S3aHg12iIixN3hNKh3/xnpOOvrw5JYNESrOEMslC3aUv9nzTTMOVRIFYKH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1ULm4xpokqC/0UFDxeOJ8CKCPVd6j6Y6FjuS5ntVFzDIZF1kE
	z3Nb6VklX/MgpUZGQrlj9HsFBCWTst0PEPDgPVFSrF92fq+WIXJNL3Xd
X-Gm-Gg: AYBFou2tRMkPQvJgrYDA+sY3sdpciSpQtOJvmkIqf7k+8+Bj8Wg55ZoCf7++bdjgX+c
	H6o6K2NRJXKhgrahsghQFqmUttXKneS3KryJGLjmX7ivHnqETmmzeG7fQ0HPhVi+tI0/ZQ39E4P
	4yaFuNglfmtHGhTmfUO7nOgnJ2nrOERSsGY5SdpAZiCeE51XhDbgLddy2THnKgZAx3K9xnwHndi
	NbM+ocvfWFKMSh0EnBDCsEFyohjZj5L2PaG7CZR+s0PBvmFF5THDqyCnel8KluqTltyB/d2wkea
	xWJ9IwEZ+8MCkBJHWAO6PQSFIypjcdUfOXLiZd3AMeVqtfzR/B3miWexSNFe9fW24JSIC/s+jZR
	MAVMV+RhNGbPeaa+mgKvN2UXVjiro+6RW+4GObdnDbbvCZ8AfaYpLS4S2jbMQp/+vTAEfWgyslg
	WYJ9QJdO45NtcWilJBPxPFBeKEZUPpmNQ/MV2wpTFlOHX3iZGEu9cSoOX+std7ko3y4TQ57vdhH
	ZEg1dRWzVsfIlRww7vBHT3yjTwyMt7+HUSjPQap0+7COllM+sHHf2MPWaZT0QOhgkB2hrReeILR
	1scgR9LuJv0YHYsdoLIMv9wvecj6ksYZEcZJ1uqsSZZw6t0mgB5Oc59Pri+1yVcLPRKT+S2Xq4X
	MLLdbtSlal4JnaMTxkftJhLWv7NkxHOu2605IceoDcgDI6Lim9lDGmPpec46Jx+s=
X-Received: by 2002:a67:e706:0:b0:7d2:cdd6:6be with SMTP id ada2fe7eead31-7d73942ad2emr480918137.21.1795131980322;
        Thu, 19 Nov 2026 15:46:20 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f3d819sm1341185137.3.2026.11.19.15.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:46:19 -0800 (PST)
Date: Thu, 19 Nov 2026 18:46:19 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, 
 Simon Horman <horms@kernel.org>, 
 netdev@vger.kernel.org, 
 Eric Dumazet <edumazet@kernel.org>
Message-ID: <willemdebruijn.kernel.16a070b2d3ffc@gmail.com>
In-Reply-To: <20261119072258.3157902-2-edumazet@kernel.org>
References: <20261119072258.3157902-1-edumazet@kernel.org>
 <20261119072258.3157902-2-edumazet@kernel.org>
Subject: Re: [PATCH net-next 1/4] tap: detach queues from the
 NETDEV_UNREGISTER notifier
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Eric Dumazet wrote:
> tap_del_queues() is currently called from the macvtap and ipvtap
> dellink handlers. Two things in this area only work because
> tap_open() runs under RTNL, which a following patch removes:
> 
> 1) Not all unregistrations go through dellink. If register_netdevice()
>    fails after the NETDEV_REGISTER notifier created the char device,
>    or if macvlan_common_newlink() / ipvlan_link_new() fail after
>    register_netdevice(), the device is unregistered without
>    tap_del_queues() being called. Nothing can open the char device in
>    this window today, because RTNL is held from the minor allocation
>    to its release.
> 
> 2) tap_del_queues() sets tap->numvtaps to MAX_TAP_QUEUES to "guarantee
>    that any future tap_set_queue will fail", but since commit
>    815f236d6227 ("macvtap: add TUNSETQUEUE ioctl") tap_set_queue()
>    tests tap->numqueues, which is zero at this point. A later
>    tap_set_queue() would succeed and write to tap->taps[MAX_TAP_QUEUES],
>    one element past the array. Again, this can not happen today since
>    the minor is released in the same RTNL section.
> 
> Call tap_del_queues() from the NETDEV_UNREGISTER notifier instead, so
> that every unregistration path is covered. The notifier is also invoked
> when the device moves to another netns, in which case the queues must
> stay attached: only act when the device is really being unregistered.
> 
> Replace the numvtaps trick with an explicit tap->dead flag, tested in
> tap_set_queue().
> 
> No functional change intended: none of the above is reachable as long
> as tap_open() holds RTNL. These issues were found by code inspection,
> with the help of an AI coding assistant, while looking at RTNL removal
> in tap. They were not triggered.
> 
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>
