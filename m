Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637545;
	b=EDXZieeXCA8BEQQVE5dl76ThUayz/8bJNXnxY4jDyTS28jcb3bhsMM7qb4YVafbIpJ1x
	 JYJdInVF+K8ABU/kedOwkbBFzIwyJdpDQGiykcgLgHwy33k6E1vZanEgBdg2C/XjqZ+Kj
	 o0SvtNSH3Tz/BYIH3Y+qsdCX+53htkd3nRndFeXv3UOkHxDjCbtbDst4bRh7aJJmI3a/0
	 y6HfKmlGCUME/a9lc3e0o2mpp9vlhAJolw6NUsYnPr2d7wDwdUHjtRFx5iSZJ4vQkAMK1
	 HrlDlhmVvB2O5+OpokFSgtkbq+p6cZQ5Oyfz66RieFxUIeTdLNWslFYdy9a4UAfEuvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=f1uKAHfLkKAcTOJ7We/ICrLc1X5GLK9RGzsgIrAvm2Y=;
	b=RPCYpQgM0Z4Yk0IqjY+qTYepmaRFhX6jEKlcSDFMqaAzalx8qgb2g6we9Wgp12B4MSTs
	 ogE9NqPGYgducEqjtcFoO4U1Q3WARgqCSTGgKYjs5EKoktPy6IhAbezdcCRRBZDtMoRwL
	 weXHD1JTTgwoI5lFZKWNjxNILoP57tD2CVT2reRYcS3cldBrJQDjpwYgeVbzYk6uAMXKc
	 OouFvARq1X4o3w4JkgW/PwylE1pCnQijDZjelRMBvLmLlln8imP8gRJxOiQIHMq+NgsMN
	 ZCM8G0/I0VckmJ/VceFm8DW4sR6hwYE3L9XvkjwzpTnDU3CqDAC4azALcOGt9KFjxEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nwhc0MCz;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D68606A330
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 06:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D68606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nwhc0MCz
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso1464797a91.3
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 22:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794637544; x=1795242344; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1uKAHfLkKAcTOJ7We/ICrLc1X5GLK9RGzsgIrAvm2Y=;
        b=Nwhc0MCzbSYPuNNbwR8XSTcIxOAE4l4DwXd6OJGo6xMpTAlIQroUO2R1yHY4R/qnqb
         LAN0sZ3NBD4WUdGraiMf29yNuNGFcAk3ZQdAFg1sAFFnMSRBk2/tRUv9TAGT7S2YJcAU
         praLP6mgHYhXVBhT50NKmDSe3LhdpYquqg3cAluCZ6rCACmsAkOP26wbar3y5uKtrxZH
         NWramTRZVChFKcjuc9uP5zdXO48JcXBMCS2ASH53JOk93dizCTnDyZjS0k0DYRncUpb8
         Zg5kr6U9mQBKivVNnyfBll6OJNHsJckKZNGfsW0eW3TmcPDAHoeQ2FP1lNxkKu4ecjGO
         mDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637544; x=1795242344;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1uKAHfLkKAcTOJ7We/ICrLc1X5GLK9RGzsgIrAvm2Y=;
        b=J02yoZYTwPwn/mJLgUSBzMxh0nAEwE72ilUO81LFTQ0sEGEmkX61kkT9WSjGsV7KzW
         3giPckqSPplf3YjckgSv+hynyUMwX9bvOZDAgrrhlNeo3JSnFmDl3H15HpXmO9Sl5H5F
         HS+ICoiQ05YGpVI9bhLbVz5hFDxu8XVZagWpa6iGgEjmXuDXMMaLnCaile0EaZIs8OAr
         S+dyH3j3VYh+mJ0AbOpNFlXJ51TDElWusVxRjilwtSH3IVzPTdH/D5x1kKrA5xLGd/Ui
         S0XOMS6zS7cG+2HcimbwndDW/hozVaXeRRgiT5jCQJIJp8dfsvcxXkYkSiOOE5KoXOiI
         6kPg==
X-Forwarded-Encrypted: i=1; AL+hErFbmCuk2H350AKryihLVXwsyi5FuCmbmZe/QwZOUDxySpVdADJBwvjIpzlukbyHTFxmNqVeyF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zO46QiGxCvKAts9sbblMm8xhAkXibTJCrL1xM/fvodo8o8DX/
	A1Jxf78uHGScE4Pw7a1HbVcakog5jpLyqERUxcZ04X/7pHZLEgGU3l/41+FYHx/ahXB6vL3Y7Ft
	trZ22eA==
X-Received: from pjuz16.prod.google.com ([2002:a17:90a:d790:b0:3b0:7a3d:ca4b])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5703:b0:3ab:de4:7fa5
 with SMTP id 98e67ed59e1d1-3b1b0b659b2mr5001372a91.56.1794637543782; Fri, 13
 Nov 2026 22:25:43 -0800 (PST)
Date: Sat, 14 Nov 2026 06:25:43 +0000
In-Reply-To: <20261110204524.82341-1-ethanf108@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110204524.82341-1-ethanf108@gmail.com>
Message-ID: <avf-PdwTjpqN7d0D@google.com>
Subject: Re: [PATCH] net: remove CONFIG_NETDEVICES requirement for
 SO_BINDTODEVICE and SO_BINDTOIFINDEX
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Ethan Ferguson <ethanf108@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, 10 Nov 2026 15:45:24 -0500, Ethan Ferguson wrote:
> The SO_BINDTODEVICE and SO_BINDTOIFINDEX sockopts return -ENOPROTOOPT
> if CONFIG_NETDEVICES is disabled, even if the lo interface exists. I
> believe it would be prudent to allow for valid bindings even if
> CONFIG_NETDEVICES were disabled, as an error here would be inconsistent.
> 
> Signed-off-by: Ethan Ferguson <ethanf108@gmail.com>
> 
> ---
>  net/core/sock.c | 56 +++++++++++++------------------------------------
>  1 file changed, 15 insertions(+), 41 deletions(-)
> 
> diff --git a/net/core/sock.c b/net/core/sock.c
> index e8551df8330f..d2da59700ecf 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -634,18 +634,14 @@ EXPORT_SYMBOL(sk_dst_check);
>  
>  static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
>  {
> -	int ret = -ENOPROTOOPT;
> -#ifdef CONFIG_NETDEVICES
>  	struct net *net = sock_net(sk);
>  
>  	/* Sorry... */
> -	ret = -EPERM;
>  	if (sk->sk_bound_dev_if && !ns_capable(net->user_ns, CAP_NET_RAW))
> -		goto out;
> +		return -EPERM;
>  
> -	ret = -EINVAL;
>  	if (ifindex < 0)
> -		goto out;
> +		return -EINVAL;
>  
>  	/* Paired with all READ_ONCE() done locklessly. */
>  	WRITE_ONCE(sk->sk_bound_dev_if, ifindex);
> @@ -654,12 +650,7 @@ static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
>  		sk->sk_prot->rehash(sk);
>  	sk_dst_reset(sk);
>  
> -	ret = 0;
> -
> -out:
> -#endif
> -
> -	return ret;
> +	return 0;
>  }
>  
>  int sock_bindtoindex(struct sock *sk, int ifindex, bool lock_sk)
> @@ -678,15 +669,12 @@ EXPORT_SYMBOL(sock_bindtoindex);
>  
>  static int sock_setbindtodevice(struct sock *sk, sockptr_t optval, int optlen)
>  {
> -	int ret = -ENOPROTOOPT;
> -#ifdef CONFIG_NETDEVICES
> +	int ret, index;
>  	struct net *net = sock_net(sk);
>  	char devname[IFNAMSIZ];
> -	int index;

nit: keep the reverse xmas tree order.

Also, please specify the target tree in the Subject.

  [PATCH net-next v2] ....

See Documentation/process/maintainer-netdev.rst

---
pw-bot: cr
