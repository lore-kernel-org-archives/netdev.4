Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181356;
	b=PnUYA9mlbK+sCins390RDuKdK1otORmYPpsYTXdrYQK2WaHEUDOVtLOsMKR09qceq4ik
	 PNHjI8Bh3nASUEuMDAnSiVj7U22hdowH3EPbsMmoQ7BL8N9S0BL66LRV8/1EXYaGxsn4m
	 GBlCQN0W5NWvJ4Ny+ZuFCY0RD/pWre1rDS7PQwlJwYQhg30BFT8W9JpeF1XbuHbQWFC6Y
	 xgIRVJEabhA14TxZr+hDxtq+1+X0K7VSnvLGYZB9Jq++UrvhUP7AkOA9o6oA+UEc5U5v+
	 IXIJHrLPXiMBL3vTu57JwEi2ILm1UK/F+eukeLthAHkBMKMnmEJgu9C6mTXbv1M1KlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181356;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=9V0wEcz4bwDJK9HLg6xYoGNRiMC7zuqdU6j4swgRUaM=;
	b=s6a3y/qIzqs/Sl5Gs2XAsLeIeF8kas4ipxHrC+QWO/taDO+TTTdDOpCySNasi5ao8jMn
	 rHSzTeglvlOaz3gJXcHUkroy9OADrOYA/JcNtdw2c/XFnh5aYG4jIm4Ibk1GaSO3C9ZLR
	 4eOQaltmXvCoifPiexAfVdg9mLFfNf4aynkenRy1yXrtEI0xQ54bGqkjNnQauHeiSxMYE
	 d9woUwSf8JBfHpS6gm1l4LetI9/0jtIayy42srs+QC4+bjd3WfaL2ISJl/kEHRaC9b7Cx
	 +WbNe5uNs64DxZVTpffKDLfQM7uw7cLAH8IIX3bSb87CIunrglUX+UfkaV4mB5WzFFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="TncHJNl/";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EAA606A333
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67EAA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=TncHJNl/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9V0wEcz4bwDJK9HLg6xYoGNRiMC7zuqdU6j4swgRUaM=; b=TncHJNl/sp3dipaIUiFJs2M4NG
	dkfmmBSHjaNZW7bj0EQZdf4bxoReb9O83OwONL296oIVw4Cwxyc66Mgi+otAg2U7bkoCE1juIHeh6
	RMU2WyEpCUXLDLd4jPpNLdZ60F+QuAkomqdh3E1eGDRwLlgRXC5ZthOXoHtwiWn5cuS0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUOfq-000IWY-BQ; Fri, 20 Nov 2026 14:29:06 +0100
Date: Fri, 20 Nov 2026 14:29:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Doddagoudar, Susheela M" <susheela.m.doddagoudar@intel.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
	"Lindberg, Magnus" <magnus.k.lindberg@ericsson.com>,
	"Chintalapalle, Balaji" <balaji.chintalapalle@intel.com>,
	"D H, Siddaraju" <siddaraju.dh@intel.com>
Subject: Re: Proposal:  per-lane PHY polarity get/set via ethtool PHY tunables
Message-ID: <112154f6-53f9-4cb7-9124-aba263b097b5@lunn.ch>
References: <BYAPR11MB27105AFF28337302B1493FFFD2782@BYAPR11MB2710.namprd11.prod.outlook.com>
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
In-Reply-To: <BYAPR11MB27105AFF28337302B1493FFFD2782@BYAPR11MB2710.namprd11.prod.outlook.com>

On Fri, Nov 20, 2026 at 12:45:56PM +0000, Doddagoudar, Susheela M wrote:
> Hi All,
> 
> I would like feedback on a proposed ethtool netlink interface for getting and setting 
> the polarity of individual PHY lanes.
> 
> USE CASE
> This helps debug link-up failures caused by swapped lane polarity. A user can read and flip
> the polarity of a lane at runtime to see if the link comes up.

Isn't swapped lanes a hardware problem? The PCB layout is wrong. The
poor person who first brings up the board needs to figure out what the
PCB designed did, but after that it is just Device Tree properties.

I don't see a need for ethtool.

  Andrew
