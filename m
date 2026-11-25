Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795610333;
	b=zI2zLn2+FvZzzAlb1lNQ2hGZfE340RWCTJWuOUOjpmv0YkVnf9xwZ7kL54sJRJ+6773w
	 Oe/tLb933Qu4ER29wzUmy2gCPXAsyo+cfkOuZrmuCNCEV328WG1NAOvyJ+k4VncN5H7fR
	 siei6vLDp+m2s5/oP2yQNzhDc+N9uk+vm6ReUx83Ahr/rG2xBOFIU/fG5hdAPnoCfQcUT
	 gyS/8lUDGzUGuqw1SIpyWphmjFY1Xf4sCoNrHTVrdUclCok7MlOjfPCyS8joGA0KJtZh3
	 a/xD4t/TlMWQDezhneCpKi2PBv8Kjxtni0JA4cBmOTDvqLXG+TAHNh9qLkGO97WT+bA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610333;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=msTE7SEkcskeFJaC952zTCGAU8KhUdHQWCTiIWzXETU=;
	b=2WljTmFUcZ5UXd+YZMOfi6lC9PIr4VjPC6IO4uF9oTFj3IGQww4ZQLfSIKxkO2O4+N6L
	 OasyXO2+L1tJTR9sK3/d2Jt4wKzNakqR6AS6e+u7X+oMCD9Rkhyn+FbDNqtBBJHQDs2Z9
	 CZHElUG0bWfUXnCT9Uvv3+LwA6V3ZNOR6tWDF7P7wLttUntanE+tG+gQrEVnE8qTJsyKX
	 /wSqElJ2wuFkqx/4ZVvm1Fj6lXa2cRDu/UffQNmL6LyxiJWCrqPDQpZORRV+CCBUryeVs
	 gIc0blkk9ZaQFuQS4v9EI3MuMgt6CLIveyJFgb6oLAaGhB7HwS9KPy3uhIYgE/kb6kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KRekYfTj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BAB606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 12:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63BAB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KRekYfTj
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3D9CB205A5E;
	Wed, 25 Nov 2026 13:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795610326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=msTE7SEkcskeFJaC952zTCGAU8KhUdHQWCTiIWzXETU=;
	b=KRekYfTj4dI8c4Z9ipvhjdpJqu7W7v1yiK10PzlQc671rtlsT0sSUk7ZOR0eaM/7NGHkCz
	KSO7JjxBO/GDyGQsm25N7wk9RD0SNs+z2KJzWCh6IPATJvoTs01OhV7/xxvsW2m/5BrX+P
	GG6SLvbc5c/uzsC8+hejZQMcet6h6jO8pZlPapEY+9KVcSnqrik15SY8VYPPGq+ijzvNgm
	RONIUR8ebQ/PE4VR2UNu1zzA9aVT7gAXWK+SXfrHGxnUEqKHNnpe5/RPFmUae23k0lU1UV
	UDN8JXxM/oR2ipAf/iZFEgBGy6uoMy2A3upqfzKqGzzqP5+RTvCxcwzHtx04iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795610326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=msTE7SEkcskeFJaC952zTCGAU8KhUdHQWCTiIWzXETU=;
	b=HQycGSlLkzmEVLPzW4wnJH+yShUukxMhFwtXtR4sUbKY0wJJGH2lEUgo2W+QXA8TAM8hip
	smQLuQSiqUQgxqzwYKDCdV275cF4kwaUWJIu0fWKiFq/8AOM3IY2XZJKGMDBeS5ZelEwJ2
	N4TNERpmktTu4psoDk1DAUcx5iC6odK6NQfbWAFmKjNU+ZVFPyGWOl4DIhmj4Ev2NF/7F8
	tGLQvXQhH+zU7+d9cgCwvSsO5lG9Xzuj+x+IWKWpAgn9JgY+FkKv0q5vv8WMu5oh8Iq+BE
	+Q2lAqK8sHUKYPQZ7pzVWvSYjEnw2Y/oz57FsVnt3QtjSGhqQGETwaYee/sv9g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795610326; a=rsa-sha256;
	cv=none;
	b=Jfap+qqm63QhiQ4Nwc9ss7Xpkjg0rY3TQM1V2qp4EiOlYegR9H/Oa8GXqYudQhYNqEgsHc
	BKuDMBuH250YDw1PXnnqCRdKG979OvnviGOp0LoTXPR+6kFHIafXWD1PsQKstBmKwXHJPX
	1ApTMazuZs56ihpLV1z/vjOoJ368j/d3gjPUM9qeGAyF4D280CZ1SckTc7OvlKq7sZD3t4
	5moMjH6bumMmQdF7eFHHw1h5v0lvG3f9iT8fMmghxGeUmoilEZ244KAP0K7FY7u3TIrHEn
	0WViUnz1ygEz0BvLbDy/BbQSUjmitTIwqPk0jnFlxxdBVmXZCg1f7oxLavu4hw==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1058)
	id 210421BF5C7; Wed, 25 Nov 2026 13:38:46 +0100 (CET)
Date: Wed, 25 Nov 2026 13:38:46 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, linusw@kernel.org,
	luizluca@gmail.com, alvin.sipraga@analog.com, andrew@lunn.ch,
	olteanv@gmail.com, netdev@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH net-next 2/2] net: dsa: realtek: rtl8365mb: offload ETS
 strict priority scheduling
Message-ID: <awbW1qIMt-Oeik10@pengutronix.de>
References: <20261124-rtl8365mb-ets-strict-v1-2-6ab01ad545c8@pengutronix.de>
 <179560221157.3135.10940899213423821559@kernel.org>
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
In-Reply-To: <179560221157.3135.10940899213423821559@kernel.org>

On Wed, Nov 25, 2026 at 10:23:31AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Should these prints be ratelimited?

Ack, I'll address it in v2.

> Can this report offload for configurations the hardware does not
> implement?

Ack. The qdisc should not be reported as offloaded. I'll address it in
v2.

> The only priomap it actually implements is prio i -> band nq - 1 -
> tc(i).

Here i is the internal priority, and it holds the 802.1Q traffic type.
The priomap index is skb->priority. Read as a traffic type,
TC_PRIO_BESTEFFORT (0) would become Background and get the last band.
The commit message says that the switch maps traffic types, not
skb->priority values. I'll try to make this clearer in v2.

> Is the comment "The switch does not use the priomap." accurate? The
> backend has a programmable internal-priority to qid table.

Yes. That table is indexed by the traffic type, so a priomap does not
fit into it.

> Does this justification only hold for future work?

Ack, I'll drop that sentence in v2.

> What state is the port left in if qos_set_port_sched() fails here?

After an MDIO error the state of the chip is unknown. The driver
returns the error at once and does not retry.

> Can a stale ets_handle[port] mark a qdisc as offloaded that the driver
> never validated?

Ack, I'll address it in v2.

pw-bot: cr
