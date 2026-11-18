Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023808;
	b=XYriY3Vcruv/+FN1dv7fJQod2CcP8H5b3Klijc7/pH9HbqqfgwHcCSrZJdpnXd4wMZeo
	 1ksg2IwNxpyS50QbrKq8SfM3U0ok/POFRSzpTJWntXDydnglMvD3JvrT+Ny8k0enBNQ0H
	 6x0OEAk8tsBpxebHvB5DNsgjuBKAu3BaHtTeQ6JzWy8+CBVF7jHfEXT/awFkQ+nFulCEX
	 g0UB2k17UqX+CPY2oIKss503y/d8PiUygW7ejvYD0K4dGfUdW9oHKgEkmG05HWjYSkITj
	 UvQiH1g2dcNf3p6MyndKYa26isWv43hnWsZ/Fjz7abSq5mVhrj/QDbF1Mm3rXmYAbaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023808;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uPLl3xwpgDX5H1PdVBFmf+WBUvg+VbeEZCbLUMxn+3Y=;
	b=P70USzIBi1WTlgWqYGmZ8ujG1GWnX9yCMFK0e5wXSMg7txk3SSGNl38YkTTkRSW7XKE2
	 YBbNbXlVobir7rm47GPn0vS8pmqa60u0+lDba+x9UgdZUjqSp9KpZKQUv73P2VwfihuHR
	 tFsGJJYN0zK3zNCmfRrC5yhxNjZhmjrcbTI45TRHsfTHGbiEzFCZcV2J9+7eLWcFxol5s
	 FSy1TXADueIWGYJzHWYf80VhNVLbIgiIRlv8UssGsubWLVEi0gpPQbRH7FvcYvw+BzvXe
	 zfFrd91egu04NJ0VDJSCXCXGt3QZYvae2X3onwXWz6Lv7CWPDyonwYofyGOnlzsd3RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nE9i200m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B673C606A31C;
	Wed, 18 Nov 2026 17:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nE9i200m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8BB1F000C4;
	Wed, 18 Nov 2026 17:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795023808;
	bh=uPLl3xwpgDX5H1PdVBFmf+WBUvg+VbeEZCbLUMxn+3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nE9i200mpUr0zIF5ta/NZZzPNXGiZERkQMGfALDDWmgZ0809RRclIfE7+YvS3eM9g
	 5zLGpAOYT2juDjSxRoKGgaQWBaskh+jRq8YVsm7N2WIgnFaNuxuIYZezl35wAPoKlg
	 zMzI7cMZPb6KzuNHA/OqrxgQSlxdYwENh7hv8Q4rtISG6/juArsgJK+cBmwm2qPENP
	 oOb0I/wkTVLnfk/KHtGam1uOaBzBQgQbxoC5xJDQOOjRySpeUtu+/M5TKAoZQZrb3d
	 rybfXVrmppMTDcCZXWi/NfOlRkeeOo2zx1CJkRvvZPur8KsGRs5QYujEdvCfk7bc7r
	 eMo4NGUhhOn0Q==
Date: Wed, 18 Nov 2026 17:43:24 +0000
From: Simon Horman <horms@kernel.org>
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	maheshb@google.com, arnd@arndb.de, kaber@trash.net,
	dskr99@gmail.com, linux-kernel@vger.kernel.org, yana06070@163.com
Subject: Re: [PATCH net-next v2 1/2] ipvlan: fix RX byte accounting for local
 traffic
Message-ID: <20261118174324.GM860048@horms.kernel.org>
References: <20261112025619.563195-1-yanxia@cmss.chinamobile.com>
 <20261112025619.563195-2-yanxia@cmss.chinamobile.com>
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
In-Reply-To: <20261112025619.563195-2-yanxia@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 10:56:18AM +0800, Xia Yan wrote:
> For traffic between ipvlan devices on the same lower device,
> skb->len already includes the Ethernet header. Adding ETH_HLEN
> again in ipvlan_rcv_frame() overcounts rx_bytes by 14 bytes per
> packet. ipvlan_process_multicast() does the same for local broadcast
> and multicast traffic.
> 
> Packets received from the lower device have had the Ethernet header
> pulled by eth_type_trans(), so their counters still need ETH_HLEN.
> 
> Use the existing local and tx_pkt flags to distinguish these paths.
> 
> Found during a code review of the ipvlan receive paths.
> 
> Sending five IPv4 UDP packets with 32-byte payloads between ipvlan
> devices in separate network namespaces increases rx_bytes by 440
> instead of 370. With this change the count is 370. External RX byte
> counts are unchanged in the same tests.
> 
> Tested before and after the change with custom IPv4 and IPv6 UDP
> tests in UML, covering L2 unicast, broadcast and joined multicast,
> and L3 unicast.
> 
> Fixes: 2ad7bf363841 ("ipvlan: Initial check-in of the IPVLAN driver.")
> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>

I agree that net-next is an appropriate target for this change.

Reviewed-by: Simon Horman <horms@kernel.org>
