Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874807;
	b=UlLZnM+DhazvI/D7jB/wdaSQBCbD+GAjvNm8gpbgYoCm5HwwvcEZC2oKQqgWgrNia4Pf
	 wf9aVN4huV/wWS2rDSZ8/IWcQ7zl7bUDzL47G3QnLYiGh0q0ROIUTT1qXSDC9gj+yA3A2
	 q325+LhvFfIfuhHlOnAJUu+9O9RxiLEV8mF42UYZDxxeTXd8yTh88iVSS6CRZOqsfDKQH
	 sh9kRO7jgqjXe5RMmGGpnaoVOV3Is6JgdcOmvmMD2mY9z4/gJbdZPJfpzcvL6oCoYebik
	 P2baOTHx0jdWJaViIOLXSb9u8GckeWvNyT5wXmC88ukYstrkdCiyq+d2oOggJzFzR0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=RbrdWR01eNMnnGuLY5WN6Vtdhl1qGXWujBNMei7/1vM=;
	b=h9NV3QYhceGqTz+gZuQZl4HBC5YmpvPmd1eAnxlIFXH1S30weQn7cnzystTP6YdmjgA+
	 4i6n8UIsAYcLbeU2y2qXQKnfjEAu7x0kmFkET6+U15BEcNCxmqLa0XWV0srQSeKR6MeOp
	 P/uZW+Fl3LzJz9VbyUEGuvO6cmcnR2aWB/t0hKZB67p1lLqAcwSTf2jMf6ysDqN4XMYBE
	 b3D0FJxYwEw1vDF7fpoxu3B/A4jA9zvg4PL3wJ9Mnvoh/dvN6asi1kcWPX/cQennk/tF1
	 NuZBurN6n0DUKxThxjagoGbsyl6VUCKczLk/WA5GB3LAa1W38UANfWTOwB+Cm9wZ1hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="jLCrgO/i";
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282D9606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282D9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jLCrgO/i
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so2750877b3a.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794874806; x=1795479606; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbrdWR01eNMnnGuLY5WN6Vtdhl1qGXWujBNMei7/1vM=;
        b=jLCrgO/ic/5lnMQoLSuLrcWSJJLk9j1wBeibgpvZL8bNE6cp2+DAZ4suo3V0FAEPKq
         08+hn2pUgz9+rm4VMSeaIxfYqBX4BDOHKnP6sD+59Nhk0f1FW5RSl2QPG27DZ8+fOLSn
         nyWialbSushN3fg6SCxfI6k5dvrXXNFQLFHXxPSmnmCdQFSQAayydmbjJFvWkH2S4Bg2
         qPZLjVjPfykjdD7EA3sHhhKtQpO84FNt6TxtSef36NejxG0ZX2vaouBgFpbidkbUp3DQ
         6CicRRms4ZEJCaOekZDduLe3c3J8U2AhJSvtoXBev7cYsyyRaBiyV8XGxZkSUVi9tUxG
         97ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874806; x=1795479606;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbrdWR01eNMnnGuLY5WN6Vtdhl1qGXWujBNMei7/1vM=;
        b=p2B/PrmxAsY9hfPMxpZ6Cb12pOKr+7WxpjuYDwhVOLr4aWwtf2Jlz8uKoK40iUGpfL
         04+0FcrgOR3oSNSW9or5234PH0dA/tcjfcWy3snwrpXQ7oVAKJCJ4HEA/qyKPvgyzi44
         LunLDtJ69pgx1xr3qmrOR7jvxZ5Sg/8CF75wx1opIaJ10HEfh4SU2ie79KFU41fWWO31
         U2oNaHZTZdYExt/Hxog2s99BbDwsuys/R09ooDI8AQYWKBFsrWbpgRnnTuFA6mArg7Xh
         cjcWd/qS3Wa2zz+VsEdAEezh2d7NgWyAyovc3+2OT9kcV+Nrknr/NAEqMfxJ99uPyLkW
         mGog==
X-Forwarded-Encrypted: i=1; AL+hErGFK6NBo3Rh/di8T72iXOKC9zQO1+ixgWjZl2QgmAyT0HK4VQ7DAPo6yIIFTCpwSsYP6ufLJ9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ViNAGCivz1DNvjl40qQFZQesvsccNAG3wKfW8mZY5Ral7ZKP1
	JCOQqFpgT8y8Pefbfc3y5CugOT8TDZRv3n144bTeIZkubZuy18m2GtY92B34ysIshAh/Onabs28
	9yHNpiQ==
X-Received: from pgby22-n1.prod.google.com ([2002:a05:6a02:6516:10b0:cd8:c6c2:d403])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3f95:b0:3eb:b9e1:4341
 with SMTP id adf61e73a8af0-3f7a8cd8fcbmr9316238637.67.1794874806023; Mon, 16
 Nov 2026 16:20:06 -0800 (PST)
Date: Tue, 17 Nov 2026 00:20:05 +0000
In-Reply-To: <20261113193355.3820232-1-hengyul@cs.unc.edu>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113193355.3820232-1-hengyul@cs.unc.edu>
Message-ID: <avudn_RA-u2FweCW@google.com>
Subject: Re: [PATCH net] neighbour: do not update an existing proxy entry on SIOCSARP
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Simon Horman <horms@kernel.org>, 
	Sabrina Dubroca <sd@queasysnail.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, 13 Nov 2026 14:33:55 -0500, Hengyu Liang wrote:
> Commit dc2a27e524ac ("neighbour: Update pneigh_entry in
> pneigh_create().") moved the update of flags, protocol and permanent
> from neigh_add() into pneigh_create().
> 
> However, arp_req_set_public() also calls pneigh_create(), with all
> three set to zero. As of now, SIOCSARP on an address that already has a
> proxy entry clears the flags of the entry and makes it non-permanent.
> The entry is then removed when the carrier goes down, and the host no
> longer answers ARP requests for the address.
> 
> A similar issue happened before with the protocol. It was fixed by
> commit cbada1048847 ("neighbour: restore protocol != 0 check in pneigh
> update"). Perhaps flags and permanent need a fix as well.
> 
> The issue can be reproduced with:
> 
>     ip link add d0 type veth peer name d1
>     ip link set d0 up
>     ip link set d1 up
>     ip neigh add proxy 10.9.9.9 dev d0
>     arp -i d0 -Ds 10.9.9.9 d0 pub
>     ip link set d1 down
>     sleep 1
>     ip neigh show proxy
> 
> Before commit dc2a27e524ac ("neighbour: Update pneigh_entry in
> pneigh_create()."), the result is:
> 
>     10.9.9.9 dev d0 proxy
> 
> After that commit, the result is empty.
> 
> This patch will add an update argument to pneigh_create(). Only
> neigh_add() sets it, so SIOCSARP leaves an existing entry alone again.
> 
> Fixes: dc2a27e524ac ("neighbour: Update pneigh_entry in pneigh_create().")
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks !
