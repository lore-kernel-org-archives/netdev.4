Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218517;
	b=pzmL0anKEZRLbuTETznu5vw+TPHzXVaFgPlFTgBx/N2DGbHslIVFFm5JJ6JloixyMfgs
	 sdpVm08wVi+0U0/iyS+Shrh6r9JAAoW/HVG5waIi/jJ+MzAia4rIsSINpInjE9fg+LnbO
	 JMPVivDZyNmuMTeQ9br6uWUcCjiovrgDn99j1YrEZ6r4eRE5jR8YDJS5lINg3REknVR6D
	 EsP2dQERibCmZueIz8hSTVjQf6CsdALvlzcnv1vanEZA6Yl2e28xPhl+MYPNYShtNFmE6
	 84hqTS2BXDbTPjt3oZkww9OWC4mDF1s6SVtmHfGf42cb8PBMUyHQXT9R4+v9S1eitQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218517;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zj5rTli9n77ky5qtA/qDG9ORlLmgtspeXHoYNy4XZns=;
	b=bWbI2woiadxlkKvGEFR+3qV4CQB0YJ9Arq+mT0FjLs6OkdC1zX8haqwageVzkiMwTV9v
	 sAynA6jiZTEzawOd7bArAnYTlv68nF5shBfppGerxkml8vqbiRObzCtM5jH7efMjqAsi7
	 9IDTv3GK1QUwFkaMHvAHggbs/HKRk2BaPaYnovWCVoWLL6hJe8OR9h7C1U9aIS38JfUIk
	 s7uJ+pF4I++eC8K1cDtk+Dgq6xq3Ld0UreDtDDqS8Gth3Eokf3rw0qVFEJYBVX8D2+KmA
	 rVzLsgwRM9qi9aIhp3NUgEWDamzLHpa1rfKEJSMPTBAyciZ5NT8H2/oOSY5LKUYulTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HfmSJfd2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E3C606A68A;
	Fri, 20 Nov 2026 23:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HfmSJfd2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511A61F000C6;
	Fri, 20 Nov 2026 23:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795218516;
	bh=zj5rTli9n77ky5qtA/qDG9ORlLmgtspeXHoYNy4XZns=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HfmSJfd2lIB+QDiw9oTQl7DRq+4pj6Xcn5xnWfvxOs6zxjxlkZuwRjR5EZxtqRBJc
	 x5tlQJhQg9JpcnWGH8nSuEqab28oRsIyhJofAyc7+egL7/QV8xiEP3HiASckDi3HFj
	 ziJXGanOhWBrU6n1rd6u0I9QrVkb3JfU27bfuxyq1wxbGXJkbEiB67lrC1cmmdUy2d
	 wp3Z17KRWD7CLmAGgAFHdiSVbpri6MOg9hZAMYclAja204s6+dvtIOeguO7ML1LKNI
	 DzqkVr6ZawRBAaXa9anL8HIQ7Xx9+vYMFR5sJfVn1gEIlbMP7nH0jupcdlwB2mN9TA
	 ck1vmKpKG2eSQ==
Date: Fri, 20 Nov 2026 15:48:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Narcisa Vasile <narcisav.kernel@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] eth: bnxt: report TX HW GSO queue stats
Message-ID: <20261120154835.0f56c410@kernel.org>
In-Reply-To: <av/RAwaDfiQnPmbF@gmail.com>
References: <20261116204313.23023-1-narcisav.kernel@gmail.com>
	<179499144094.3136.198428718668517773@kernel.org>
	<av/RAwaDfiQnPmbF@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 20:48:03 -0800 Narcisa Vasile wrote:
> > [Severity: Medium]
> > Can this over-count wire packets for GSO skbs that were sent through the
> > TX push path?
> > 
> > This block runs before the is_push early-out. It treats every completed
> > skb with skb_is_gso() && !is_sw_gso as segmented by the hardware.
> > However, the push path gate in bnxt_start_xmit() does not exclude GSO
> > skbs:
> > 
> > 	if (free_size == bp->tx_ring_size && length <= bp->tx_push_thresh &&
> > 	    skb_frags_readable(skb) && !lflags) {
> > 
> > The push BDs never set TX_BD_FLAGS_LSO or tx_bd_mss, so the NIC sends
> > the skb as a single frame.
> > 
> > Take an idle ring with tx_push_thresh at 164 and a GSO skb of 164 bytes
> > or less. Two examples are TCP with a peer-advertised MSS of 48 and 96
> > bytes of payload, or UDP_SEGMENT with gso_size=8 and 80 bytes of
> > payload. Either skb would be counted as 1 hw_gso_packet plus gso_segs
> > hw_gso_wire_packets, even though only one frame went on the wire.
> > 
> > tso.py reads these counters, so could this give misleading results
> > there? Fixing the push path issue described below would also fix this.
> 
> This couldn't give misleading results there, since no GSO skb in tso.py
> can be 164 bytes or less, so none can take the push path.

Fair, but UDP segmentation may sneak in there. I will check with Joe.
Either way, I agree that this is orthogonal.
