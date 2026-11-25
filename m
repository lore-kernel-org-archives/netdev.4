Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566748;
	b=RR4oyPGFmf+jVjOqnrfllYo1d4PSXlvzyStMyHO0gMzaKWpHSlWaBhUXqw0BC4k7p7Lu
	 VtVYyrxynAjjw99eLOsJJhscrqMwmS+D9vzAqVCXR6BAJ5AOAExUXCYjvLkl1ADtIhYHR
	 Hd+wK6aTVK/y+vxZxidHES/3VixSFe9qjdxoL3NLGmrCpwaKE6gomKTnezo2zuw1i/9RI
	 5wrKgZcSTT7T+Qg2ghkv6EXx+5Mzjz9nHQR/UvtxWAk1FcXnz4UWLVmYwhtlcqH/yC/2B
	 pCpArIbG9Kf0oBnrb9VaoJy1lEbKzgSxzD/gIFLKRHDIrVubph1MZIKnt9maxRIbBOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566748;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=jcayB5wbddvbJv+RlR0Gq8xz5JzClNUc+dvRG47re24=;
	b=VJu2Ym0R6Xv2TRz3rSnxpsPyiXPzg7BRS8xSoSonTsxEhjjNvqLHhd2Wh+xm3uWqgnZW
	 5ST8TMVGDe6YqAJlAyYh80f96j7CoBsLL7VontIHeNIkdQ4hYDK9/dU3K3LlSjs2m0awH
	 RNhnGgdQ6TYNVJylfdO2ND3NfIvQh7kranq0zUq/WusRJ72FSNlCZoPXvgs1g9C3A/zIJ
	 dI/O0w3yPsvnYost2ljM5gSHYf50Ws8BeaHalmnyhq4K21ovHlvJN7Ms/+MHGOYCLKcOG
	 P3xpAmpwmLzDKK7U/nypS4QRMPkbVO+rp/wXMVsgmLd53UxqTDYwBWCGlgbPjOOc5ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=HK8UfW9N;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B49606A31E;
	Wed, 25 Nov 2026 00:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B49606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=HK8UfW9N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jcayB5wbddvbJv+RlR0Gq8xz5JzClNUc+dvRG47re24=; b=HK8UfW9N/Ll4P255xwebaLZL+A
	upenHWed5xaZmy91K8XtHXS13Hfir36MApHVg6DZJfI6UnrTCrvi7hBG92/J1eQodY5nfeZtnLKdH
	2JuCyFn5i8GkRGUu5PwNJAAAqk6wxD16dy+eY2qfZ5MMrk+qbDlxJOIQNdud0eeIBCwE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xW0vu-001Cc2-QP; Wed, 25 Nov 2026 01:32:22 +0100
Date: Wed, 25 Nov 2026 01:32:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Babroski <cbabroski@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
	linux@armlinux.org.uk, Raju.Lakkaraju@microchip.com,
	maxime.chevallier@bootlin.com, yuiko.oshino@microchip.com,
	nb@tipi-net.de, woojung.huh@microchip.com
Subject: Re: [PATCH net-next v2 4/7] net: lan743x: keep the fixed link across
 reopen
Message-ID: <e6e313c6-aff0-4110-a12d-bd26b012b6e9@lunn.ch>
References: <cover.1795027003.git.cbabroski@nvidia.com>
 <ef118120626788ecb28b9d38283ca0130625f921.1795027003.git.cbabroski@nvidia.com>
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
In-Reply-To: <ef118120626788ecb28b9d38283ca0130625f921.1795027003.git.cbabroski@nvidia.com>

On Tue, Nov 24, 2026 at 09:33:19AM -0500, Chris Babroski wrote:
> On LAN7431 and PCI11x1x boards with no DT node and no PHY on the MDIO
> bus, lan743x_phylink_connect() falls back to a fixed link with
> phylink_set_fixed_link(). That switches phylink to fixed-link mode,
> which neither phylink_stop() nor phylink_disconnect_phy() undoes.

I can understand your fix, but architecturally, it is wrong.

Anything which open() does, close() should undo.

Anything which lan743x_phylink_connect() does,
lan743x_phylink_disconnect() should undo.

So this might need you to add a phylink_unset_fixed_link() do undo
what phylink_set_fixed_link() did.

    Andrew

---
pw-bot: cr
