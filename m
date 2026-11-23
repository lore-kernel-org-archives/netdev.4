Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445669;
	b=YL0x2asLvSOsLxtfdydjIxqSq8u/3Pc5uVewvrm+ROs/Oi7Gs0KFXUagcbPDi9PYnRdj
	 7ipSFqsUI91Wrw575LpFJ8Rga+kGYE84IL4+y/b38oCCWB6ykofgdj6NjLDMYVCgd3RGA
	 nSKEl+S5RLaM8HJDXnxYQI403ALkiZO5CpUGbtT1j9ehDnQnbyIemuSdmew+nARRRDY2S
	 +nZalYLgppQVOQ2BmoXd0QllVjTSuLWmIgQWt5IgVlILzOY2KXy1Wsb6YbM3tFUMgH0/Z
	 fUI1d7TX9k+oS5WPz5YQWluJGrfuXgZsDKrzr4m1qn3FxlsmTKgpmez0edJT5hS4LJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445669;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=MTEd3wJh9azedyr+Vm0OAaPXjbeBgq/pERaDwYxZA58=;
	b=bFykwKI5zCpAMYy0lmhi9U+qduwF0WWDbr4NwAH/d2EZPydsbT5KXhG6HDtyq+Yb0GHs
	 tNFAOmiX8PwT4c25Csowq5g9ObyXn2VBT0tIU8MG5lm/3kCR0iF0QeS8zicPTQdwgi0Fy
	 KpAnsDQlfsl3ID5d+hdzoSpZ7lcRXL9cnPpIK0erDzys8t+dNMsiq1sLxXiLEBizXVPzs
	 QRrXj5xSDpNXslAxzevYHBiu57tDxO7AgKa+Yzbm7lLqMrlB30uSiFxTGl+tgBIlEfxiC
	 qFPu50MplQNB1m81DVWfiQV7I29O/2jm8yvgorAyb0hKCc4APPJoV0dle+s5i0yw7+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=cNdIsRMP;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF341606A685;
	Mon, 23 Nov 2026 14:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF341606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=cNdIsRMP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MTEd3wJh9azedyr+Vm0OAaPXjbeBgq/pERaDwYxZA58=; b=cNdIsRMPZzGk9F22Vz/MFAAmWR
	ghXAdcK+XwK41QDKuIuJ13CTPZg4D/W36ZBQ0jm34wOrNT1lvFdBteg3/Rpn0KyYZ4XOl1yNUydac
	iz9pmO5NuxUxaiRBCJ+4i/7s+cEa1IMG1fruHsRPlZGsvArBbaNDYTld1wJAcSY2QG5g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVVQk-000oBI-NR; Mon, 23 Nov 2026 15:54:06 +0100
Date: Mon, 23 Nov 2026 15:54:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, rosenp@gmail.com,
	jacob.e.keller@intel.com, daniel.machon@microchip.com,
	chunkeey@gmail.com, kees+treewide@kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	xiaolinkui@kylinos.cn
Subject: Re: [PATCH net] net: ibm: emac: attach the fixed-link PHY with
 of_phy_connect()
Message-ID: <4ed4f82b-3ff8-467b-9127-bdc29d498ae4@lunn.ch>
References: <20261112075321.3903875-1-xiaolinkui@126.com>
 <ef2eb733-4b94-4c2e-9165-0b324733a482@lunn.ch>
 <20261123091012.730441-1-xiaolinkui@126.com>
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
In-Reply-To: <20261123091012.730441-1-xiaolinkui@126.com>

> of_phy_connect() only stores the handler in phydev->adjust_link, attach
> never calls it. The state machine is not started on this path either -
> emac_mdio_init_phy() runs only for the phy-handle case - so nothing else
> fills in dev->phy, which emac_configure() reads to build MR1. A fixed link
> cannot change, so calling it once is enough.

The whole point of fixed-link is that it works like a real PHY. You
should not special case it other than when creating it and destroying
it. You should call phy_start/phy_stop. When start is called, phylib
will call the adjust link callback, same as a real PHY, and setup the
MAC as needed.

    Andrew
