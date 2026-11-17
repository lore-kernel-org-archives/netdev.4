Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929590;
	b=Qw469meVg0GR4mzRAWZnfGZjl4KNaBwc+GKj4cNJ+m+qv9Pq7v3amXq4PVtGnleqjPhJ
	 NU0gC/+iwfleXkOTKf7Sh7+Aqm0dUUQSlvoiggdyXWJ8cvoI2RM4NEKufic2bLLG5iqMd
	 KU241Tu59wVD7uHJCREdHQo9gMsJFrDoHzccI9L9//wm8f6zDTNu2bnjXX6D1l/gYOvVR
	 btcplMk2J9d6ehR4aPsJHLdrlIOBuoKxz5h7rlFQWRwBxb5KW8qc7p/byUKlYLwpC50xN
	 im0slKRfuLZSMA4O+hoY2gqpC+QIr9DOqmy3xKyhGdmj8/COHPWEDufXKv8gAMTp0TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:Mail-Followup-To:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ic0ZV2l8vdmrXTqu+lMUrh7Ne4ma2q8MNEr28fS3hxw=;
	b=PSvjpWXVzRnWgDnXrWNnk9Qr1yg62aKB0bAYmJ59t9kX0s81h+Dj+vGiRLJ3GeNmd/bE
	 HME8g1LV4o8285jPQnCVLAg1ql4JiZ7h4LtOICJCjvY4vBnG6JtdqQFf87Ks3Avhow8t/
	 Yi/iAc2Bv2HjarwzmlUb+X0OErkqOK9zi/GCeUl299U0kKr5QWZib2gBzta61ztTexL8o
	 vR5NMMUdw0V/rFCf/PB8BzUL1NMECTA5m49cr0OIeYElM1IhNUdZs9IeaCKb+Tn4tj4lC
	 djhGoT4GQQ9EVcY8vqR+BOakhpRlaukIuQwlal/yvIihwtvxdq5bzkf8tvYmkn2n3Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Nq2As/OY";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46497606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46497606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Nq2As/OY
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so2291393b3a.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794929588; x=1795534388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ic0ZV2l8vdmrXTqu+lMUrh7Ne4ma2q8MNEr28fS3hxw=;
        b=Nq2As/OYS8Rk/AJs+LfYrpJSfF6Buvx+xKdbIX4flq+eZrRjURbUNWDmvARrjsOMyp
         G4Gx7PLMS4t+lD5oQcYMVZipAItazYPQ/M4meWE5SJxFxatVGe9ROPR8uYtsVXSKDFFO
         ktD3ViGsehj7fvmOS+rsJFzMQP/LL7SrApPeoCrIZkRytaDjhZQ0X7IYsR5XOepFhFt+
         JKJ3eI8Od+PvKhxlcvAMz0AvFtM/rG8vP7w8MNFXVtYOsThIy0qp3z1ylgviHTV2ORwT
         6txojRUx4fE/Wz5UNh/Mhq0JSCVkqHb7tGYrHXiJfW2XoLH9t7s6zh9hLk+TgqK7sshF
         VhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929588; x=1795534388;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ic0ZV2l8vdmrXTqu+lMUrh7Ne4ma2q8MNEr28fS3hxw=;
        b=JDir4BKI2cj2pXyUbUz7l6jAx775MPzbD/RgBNTtkaQ6SgqpXcXa1iyuL74wrp3QBE
         R00Qv2BIXAjG3iq6vdffPE4YF8LaDSv5Tf1pcYxlTjpuLW99wOLyes9MjQd3ThOjGYTX
         1BZ79FfJkD3KMYqPNDZaYD3n9sY5gsrJ6RZiRXwJeC8JYoGolKKsPf1BcmnzgFn1s0a5
         Ll8sK6jA12Z6QT5NU9DRzJPwiz4dGroGR/WJ3DZmfsEm42zK8u6hsKLputVt1cHjh+Kt
         swfGmWhynL5mEGcFvVKBLdyf+TwiDItFmG024MDOEKY8hal/OOWXqUXS7AZbapWHHYu+
         jRWw==
X-Gm-Message-State: APuU4Z9ujK6uVPZdDcD9nBNCZOOiboJ8u2HLnFJd1tIdP06jhmxcICFY
	mqxz1RMGDUa/Bhmge/GCIYafbblgZq1CZCnpGuBLk5MtQxeruUgL8y1Iwo+4tXeTeNc=
X-Gm-Gg: AYBFou0F1331cxN0M1n2qQXb5iunVgb7VkTcsM4P2wU83dj0oPLdDJUQH3KhbkOCtCJ
	rZtLNPUgLCjcF0a6/qiY6ylTeX5QJb/WZUjNalk/BNwYoYgUbdOUq8MXhduWzgO0mKWmabO8E8+
	U0RRKE8nFG/vU5YOmJlsMOnPDwgNgAW6Pf2nx7OlJa+4h6qOThBngbEygZc+jTd22VXmYF4Y9Zn
	SgIovh/bvxZWhJP+ckLR3OG3aS+cu2/5Mr8QB0rPkN4RofM9iffGaeWwOQSXaZUuP/llKvJbnkN
	CS9fn9Ocfw/kXBFizBZASWUfFvmhe+tY8VzqWw9gb3hRHET2bKnDb3gwzgkD4ulXAV71qxh25/N
	AFIFG5N+5Y8yu9y9kqSYuz6RYl6tUVOJMrtIK12v5Qbtec8f4NSoVLI94KWRhzSf5twpmdc77a7
	aM/e7gIIAKCLeb8Cy+tybPhu4qVZhFuzXgF499K16OtDJv2xJC9QxkVWRH33YbvnHRpzlyFdtrH
	nnTQ6rygmhtVigkG6YT1Uilh+JxkExR0TGfI7zlBryi4lIjhkFu41qozuVbwU9hENaxu0N+YNXQ
	cuW794cJG58CiE3EBpUMpssW5vqwpSSz/AkoRAMDtw==
X-Received: by 2002:a05:6a00:17a8:b0:8a0:70ff:ab2c with SMTP id d2e1a72fcca58-8beb7e12866mr12534223b3a.57.1794929588396;
        Tue, 17 Nov 2026 07:33:08 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:3::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8f63sm5517226b3a.9.2026.11.17.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:33:07 -0800 (PST)
Date: Tue, 17 Nov 2026 07:33:06 -0800
From: Joe Damato <joe@dama.to>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: netdev@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	edumazet@google.com, horms@kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 5/5] net/mlx4: flush pending doorbell when
 dropping a TX skb
Message-ID: <avxzsj1Ro8Mzazmz@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Daniel Machon <daniel.machon@microchip.com>, netdev@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	edumazet@google.com, horms@kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org
References: <20261110231304.1859217-1-joe@dama.to>
 <20261110231304.1859217-6-joe@dama.to>
 <20261112134346.zvctvknj4mc5s2pm@DEN-DL-M70577>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112134346.zvctvknj4mc5s2pm@DEN-DL-M70577>

On Thu, Nov 12, 2026 at 02:43:46PM +0100, Daniel Machon wrote:
> > If mlx4_en_xmit drops an skb (for example because DMA mapping fails) and
> > that skb happens to be the last one in the batch, the doorbell for the
> > WQEs posted earlier in the batch isn't written.
> > 
> > The queue stays awake, though, so those WQEs are eventually announced to
> > the HW after the next TX, but that depends on traffic and could induce
> > latency.
> > 
> > Avoid all of that by writing the pending doorbell in the drop path.
> > 
> > Signed-off-by: Joe Damato <joe@dama.to>
> > ---
> >  drivers/net/ethernet/mellanox/mlx4/en_tx.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
> > index 123071a47bed..3166837711be 100644
> > --- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
> > +++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
> > @@ -1135,6 +1135,9 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
> >  
> >  tx_drop_count:
> >  	ring->tx_dropped++;
> > +	/* an earlier skb in this batch may have deferred the doorbell */
> > +	if (ring->doorbell_pending)
> 
> I think checking !netdev_xmit_more() here would let you ditch the new ring
> state, but it seems bnxt does it the same way, so fine by me.

I need the state for the SW USO followup I mentioned in the cover letter.

That aside, every mlx4 doorbell site today writes it only after posting at
least one WQE. I think replacing this with !netdev_xmit_more() might write a
doorbell with no new WQEs and idk if that is supported by the hardware. It
looks like the XDP path gates against that specifically.
 
> > +		mlx4_en_xmit_doorbell(ring);
> >  tx_drop:
> >  	dev_kfree_skb_any(skb);
> >  	return NETDEV_TX_OK;
> > -- 
> > 2.53.0-Meta
> >
> 
> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

Thanks
