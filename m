Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164919;
	b=IYcriv7aUQCS0bSExPesRhZTgV6bNMH8aX7T7Zg1iK80fShReZaCrTOfZNKC3IChuVl7
	 TdVUJQp9MX9hhQRMYfTSEcctsKkBJ+HiXiKiVRuQ8PBdNEfh5JGgMes/Dw/8RhhOsLYJW
	 C06uD9bjJdIW9zkHUMLT2ZtCzfxeUEJtvk3I8sEtZtacPkQFtrSsB3FWziCRIYm14NEaF
	 wmuPifJSP6Z2P/5UcMEvq/1TxfX4wnVDteXaoXuJZ5BCeY3eYwvM172t1wK/CoglhJSw/
	 xUtny73roQVaUKCIh8oW7lFJOqD1yT/JWAD2IQqqDfLsAe1mi8bizMEr9ZNJTsonqiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164919;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=wAR1oj0jWIAovH51D7/UJIXhhjioZB8Lads3EGhnueg=;
	b=BvJk+d3v2YRJSbPsil1jX63W6jz95xnIPzRi7c7WlkSfmVts8zjeGZlvXcPIHRnCU+Cy
	 1mKo/ATHZiDHi7PGfH6mfmuWODIDw/si8i3uiMX4LtrFUZyFZ2p/AEe7jmDWbi9yRvbFu
	 tkMQNPSgtHxrgamdlaXD1Y9cHFInvNPUGy+18ryJnxwJShkknZCBEIjsTkb9axPuJyKaT
	 30GVT+uWkxZg6P/6i1/XBRg+p/MYqzGC0+6acFeKdRx1Q+DuIu14nhfaCVDsDyJdsKF2M
	 NJKjyPw+02nrbmRzqZ1FSXxEEo656XBPoGYOpRqOlpQFY4VyvWXAYydnj2lUZ6X+NdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=E3l4bOAh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4HPvNy8N;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDD7606A33C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDD7606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=E3l4bOAh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4HPvNy8N
Date: Fri, 20 Nov 2026 09:55:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795164916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAR1oj0jWIAovH51D7/UJIXhhjioZB8Lads3EGhnueg=;
	b=E3l4bOAh4Lz+vtRgjzgzdnOA264kWgZobWfzWWE5l5r2YcXcCltD0neH4nJxOdwzbdJ0+h
	7Si5CQPtPY7DOxuOfWpOutGN7m9aMTpfEmDikBrwM4vIlPvr5rgcVN6q/M6RG/g3nKCKiL
	nruFQqZqo06n8jp1aqMBuMaz9VPhB9mBK4qSmSdS9HHdPDEcZmmlCghL3Fts1RrG6zQ0NQ
	bnQWKO0HGJsOSlVJTkBSiz+biIUkV3i8FeT1hP5EdX7UbsMcB3kTP+AkXowsMBsON7f3hS
	PNCDSMS8KiBkurCfuMvzMOS2KVSUJbSg1AROe6JdSpAfQWNESwKXQXe+njqx1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795164916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAR1oj0jWIAovH51D7/UJIXhhjioZB8Lads3EGhnueg=;
	b=4HPvNy8NowoI7bx1eiCDLjfNa00rXxUgpeSkao88Wr8bSCperDDAiPvgRUm0+ef4RG/b7X
	k522PmiYBxiRZ7Aw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: netdev@vger.kernel.org, "(JC), Jayachandran" <j-rameshbabu@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chintan Vankar <c-vankar@ti.com>, Danish Anwar <danishanwar@ti.com>,
	Daolin Qiu <d-qiu@ti.com>, "David S. Miller" <davem@davemloft.net>,
	Felix Maurer <fmaurer@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Neelima Muralidharan <neelima@ti.com>,
	Paolo Abeni <pabeni@redhat.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Pratheesh Gangadhar TK <pratheesh@ti.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH net-next v10 3/8] hsr: Add a magic header for sending PTP
 packets
Message-ID: <20261120085515.Yd_dUps9@linutronix.de>
References: <20261104-hsr_ptp-v10-0-2c4a38ad973c@linutronix.de>
 <20261104-hsr_ptp-v10-3-2c4a38ad973c@linutronix.de>
 <20261110131214.5i4b3jt7iigbewsw@DEN-DL-M70577>
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
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261110131214.5i4b3jt7iigbewsw@DEN-DL-M70577>

On 2026-11-10 14:12:14 [+0100], Daniel Machon wrote:
> Hi Sebastian,
Hi Daniel,

> > --- a/include/linux/if_hsr.h
> > +++ b/include/linux/if_hsr.h
> > @@ -3,6 +3,7 @@
> >  #define _LINUX_IF_HSR_H_
> > =20
> >  #include <linux/types.h>
> > +#include <uapi/linux/hsr_ptp.h>
>=20
> Is this needed?

hsr_device.c needs the defines and the struct hsr_inline_header from it.
Let me move it there where it used.

> > =20
> >  struct net_device;
> > =20
> > --- a/net/hsr/hsr_device.c
> > +++ b/net/hsr/hsr_device.c
> > @@ -223,24 +223,71 @@ static netdev_features_t hsr_fix_features(struct =
net_device *dev,
> > =20
> >  static netdev_tx_t hsr_dev_xmit(struct sk_buff *skb, struct net_device=
 *dev)
> >  {
> > +	enum hsr_port_type req_tx_port =3D HSR_PT_NONE;
> >  	struct hsr_priv *hsr =3D netdev_priv(dev);
> >  	struct hsr_port *master;
> > +	bool has_hsr_header =3D false;
>=20
> RXT.

ups.

> > =20
> >  	rcu_read_lock();
> >  	master =3D hsr_port_get_hsr(hsr, HSR_PT_MASTER);
> > -	if (master) {
> > -		skb->dev =3D master->dev;
> > -		skb_reset_mac_header(skb);
> > -		skb_reset_mac_len(skb);
> > -		spin_lock_bh(&hsr->seqnr_lock);
> > -		hsr_forward_skb(skb, master);
> > -		spin_unlock_bh(&hsr->seqnr_lock);
> > -	} else {
> > -		dev_core_stats_tx_dropped_inc(dev);
> > -		dev_kfree_skb_any(skb);
> > +	if (!master)
> > +		goto drop;
> > +
> > +	skb->dev =3D master->dev;
> > +	if (skb->protocol =3D=3D htons(ETH_P_1588)) {
> > +		struct hsr_inline_header *hsr_opt;
>=20
> Is 'hsr_opt' a leftover name from a previous version? I would have expect=
ed it
> to be something like hsr_inline_hdr.

Right. Let me rename it.

> > +		struct ethhdr *eth_hdr;
> > +		unsigned int hdr_len;
=E2=80=A6
> > +		eth_hdr =3D skb_pull(skb, sizeof(struct hsr_inline_header));
> > +		skb_set_network_header(skb, hdr_len);
> > +		skb->protocol =3D eth_hdr->h_proto;
> >  	}
>=20
> I think that is a big ptp-hsr specific block in a hot xmit function. Pers=
onally,
> I would probably have put that into a helper hsr_ptp_parse_header() or
> something. Not a big deal though.

Hmm. Hot or not there is a comparison at the begin and it should jump
over it. Moving into a function shouldn't change the outcome since the
compiler will inline it. It might look nicer and the "error" path is the
same so let me make it a helper as suggested. There is just req_tx_port
and has_hsr_header that needs to be passed around but that is doable.

> > +
> > +	skb_reset_mac_header(skb);
> > +	skb_reset_mac_len(skb);
> > +	spin_lock_bh(&hsr->seqnr_lock);
> > +	hsr_forward_skb(skb, master, req_tx_port, has_hsr_header);
> > +	spin_unlock_bh(&hsr->seqnr_lock);
> >  	rcu_read_unlock();
> > =20
> > +	return NETDEV_TX_OK;
> > +drop:
> > +	rcu_read_unlock();
> > +	dev_core_stats_tx_dropped_inc(dev);
> > +	dev_kfree_skb_any(skb);
> >  	return NETDEV_TX_OK;
> >  }
> > =20
=E2=80=A6
> /Daniel

Sebastian
