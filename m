Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845382;
	b=PwsWI8X8aP1hevtw6ySVtIKfsGgR26ADF8u+i6rW05XkM/N+MpW5X6cUazN1GFXkzQDC
	 zI3mjgEHHxu5z5BVAR5cyJ+m/L/YY5sToKVfDUyxtIOeqGHya5/91d6Dkx8kHFsvib2cj
	 uikoVEERV2DchzXka2bgh6ElAhzH6uqmMhUvEO9hSX/pVbWKEPa7ZyR3n7vlG8hQh835y
	 0wBAf7/rX2DDKAeWmMtPC8bumbUssU+hCJl7lbqRb0NpSlRDbsrq+vi8zrEzhI50hwda5
	 MaIqp4eF+bdxarpENAG6Y/7W7cR+ymKv+qPq//5ixikzkRmfsNS/s4BEqLeU0JoumhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845382;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=k442VjNAgTRK01arDxCo74sZ/IUCWSOvu/yQtHpOYbc=;
	b=m4vE2y77dbJdqA+MZ69jqntjLSMRaKIzxSpk1b79jLoDz4SJnndnjX2uVwuYuIjvvx33
	 AgrI+nIYUxX4TkbVon0AyxBnBx/XdpshZxsrPSeTE06RlSk/VRTkTz+qwD7udBrXqKcg6
	 vxog7tTfqJNSUHl+JCG+2FM3qiV6nTfwjLA5uVH7THv0n3b4dEyyeTH56nSa7Z1r1DNn0
	 iuC01sghIAriF/W29W7cH+Hjh3U6pylKkGpi7Jx5j75R1R5VOhchyYJJGRE7nHSXcV7IG
	 V/m5KYwS/agfuL4vvU+A+/JMZ79S9/g8AvmxSFcug/goOKbKVHW6m37/rcQc9lyJHlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=k7lMJ6+7;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C964606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C964606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=k7lMJ6+7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9447B1A169C;
	Mon, 16 Nov 2026 16:09:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 662156023F;
	Mon, 16 Nov 2026 16:09:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40CFC11BC146D;
	Mon, 16 Nov 2026 17:09:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k442VjNAgTRK01arDxCo74sZ/IUCWSOvu/yQtHpOYbc=;
	b=k7lMJ6+7AhYnaYvY82R1DvzIhN4zHmQZ3VDVTttNGtJH6ANkEgdXIeR1CpN2CEF2hoYXJy
	sL7WhLKofJrdr5cqC6aR97+94ECZx7wWLy9K7/RngBU+a/rU1zi4zeCBJ0UdfIG96koqh+
	kx38y8XL9kChVFjozBShYbJ97bDsqa1uJmb73Budvya7HQuReuDP9kIZl4oT0TbNYUb/58
	Bqt/6Wqtyxq53eQq1A85Ys6bev1mPbsN+efZBx34RZ8v81hNeK2e6e8jGVhA5nGgOpPtXx
	wqUYOSNjZ7kseNdDddogbsIdHRqTasD5U4FWramVuOzx/irq2vmBmQQW8Qd+9Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yifan Zhang <yfzhang23@stu.pku.edu.cn>
Cc: linux-wpan@vger.kernel.org,  netdev@vger.kernel.org,
  alex.aring@gmail.com,  stefan@datenfreihafen.org,  davem@davemloft.net,
  edumazet@kernel.org,  kuba@kernel.org,  pabeni@redhat.com,
  horms@kernel.org,  zihanx@nebusec.ai,  stable@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] mac802154: validate pinned interface before
 beacon transmission
In-Reply-To: <179378621331.55520.8126896786309171541@stu.pku.edu.cn> (Yifan
	Zhang's message of "Wed, 04 Nov 2026 17:56:53 +0800")
References: <179337523079.51423.6573078122047317758@stu.pku.edu.cn>
	<179378621331.55520.8126896786309171541@stu.pku.edu.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 17:09:32 +0100
Message-ID: <87y0aspxkz.fsf@bootlin.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

> Changes in v3:
> - revalidate the request and pinned interface under RTNL
> - serialize beacon template access with request replacement
> - free the skb on every failure before the transmit-path handoff

I think on this point we should have something a bit unified with the
scan worker, because both handle similar situations. This is worth
fixing in another patch.

> --- a/net/mac802154/scan.c
> +++ b/net/mac802154/scan.c
> @@ -354,35 +354,31 @@ static int mac802154_transmit_beacon(struct ieee802=
154_local *local,
>  				     struct wpan_dev *wpan_dev)
>  {

...

> +	rtnl_lock();
> +	beacon_req =3D rtnl_dereference(local->beacon_req);
> +	if (unlikely(!beacon_req || beacon_req->wpan_dev !=3D wpan_dev ||
> +		     !ieee802154_sdata_running(sdata) ||
> +		     !netif_running(sdata->dev))) {
> +		ret =3D -ECANCELED;

Since this is not an error, the caller should maybe not amit a log at
the error level. Again, not worth a change in this patch, but would be a
good follow-up.

> +		goto out_free;
>  	}
>=20=20
> -	sdata =3D IEEE802154_WPAN_DEV_TO_SUB_IF(beacon_req->wpan_dev);
> +	/* Update the sequence number */
> +	local->beacon.mhr.seq =3D atomic_inc_return(&wpan_dev->bsn) & 0xFF;
>  	skb->dev =3D sdata->dev;
>=20=20
> -	rcu_read_unlock();
> -
>  	ret =3D ieee802154_beacon_push(skb, &local->beacon);
> -	if (ret) {
> -		kfree_skb(skb);
> -		return ret;
> -	}
> +	if (ret)
> +		goto out_free;
>=20=20
>  	/* Using the MLME transmission helper for sending beacons is a bit
>  	 * overkill because we do not really care about the final outcome.
> @@ -402,7 +398,16 @@ static int mac802154_transmit_beacon(struct ieee8021=
54_local *local,
>  	 * transmissions, wich anyway does not have a huge impact on the
>  	 * performances given the current design of the stack.
>  	 */
> -	return ieee802154_mlme_tx(local, sdata, skb);
> +	ret =3D ieee802154_mlme_tx_locked(local, sdata, skb);
> +	rtnl_unlock();
> +
> +	return ret;
> +
> +out_free:
> +	rtnl_unlock();
> +	kfree_skb(skb);
> +
> +	return ret;
>  }
>=20=20
>  void mac802154_beacon_worker(struct work_struct *work)

Again, not related to this patch, but existing issue: since you are
fixing the beacon path that is very close to the scan path that has
already been fixed, there may be a missing cancel_delayed_work_sync() in
mac802154_stop_beacons_locked() (the timer may still be pending when the
PHY is freed).

So for me the patch is correct, but follow-ups are needed.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
