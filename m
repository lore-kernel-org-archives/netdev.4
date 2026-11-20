Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194064;
	b=B+uNue5h8FbtashLo2vTOfu2vHUHqsRqN+mq0xLg6BVddZRandpqG2fMhROCWDsZ8EGK
	 9lGdu4Vu9PuzAGWD1lu4yCirYoJN4+BXGjKRzKfhbQbo+hOS+DwbWR1qLho9yK0qKnrfV
	 PQM2mRrBL/XqfONU/0glnKYG8GK6MGEBFdFsgpIkKXQH5F6ZPlDnbyoSnfAc7+NOOineA
	 yGp8rXuf9FsckYv2HOOtOL49SbHmjdwzqKmnwi7ejlftIWlkMp4mvjtmzl6yYinrVaO+T
	 SfY9puQVMWhHMqfklMoxIJrvgW7bsP4WImAUQua11LsnmO9KLgOn3UI+Um5QB12V1lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194064;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=+SBEbYMnCfS0wR4VSNhGdIGif4ouwcd3YyOPI5uczzM=;
	b=fsjDUpfHJe7JnNvDORJefwRFU7vcOE5H2B1tFQveo2LswZ+kIcbztrDPOcfTfnoMRktO
	 Lb/ZduBK06s/ij+YKYgCifchFzBhB4v/j3/8pAMEGuGX4jmlgX7y//PZsbNoVPjbRn23m
	 0qPr3PEp8gUw2B+nx/allk9JC+YlzK81VcSQMuQXZgeUXdOOqmzJFkdd0RgL9TcjumHO7
	 MVcmzAJL5foDLRah7xkmS9NB9/jUYFCr8uu77dF1zLtbebbRWSRL6FSODWqomyXuvtLn2
	 5uFiJpmMdHJo+3EutTch1n/LlNBwbpCuMhajLbIT+jvq0e+Xmbm9Xw+q4ieQVsaUvRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=WbzEuBgE;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBA8606A33F
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDBA8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=WbzEuBgE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+SBEbYMnCfS0wR4VSNhGdIGif4ouwcd3YyOPI5uczzM=; b=WbzEuBgEXeLwdhvRcMBEgZPzI2
	XEHk8m9aAxSz+NIUYXQWOJpYJ8gme2Zm/aOj6J3MIqUKAnj5EA72HUZBxuE8xacw9i9Z95mRLJ5g1
	asD99yuDHasCWhczQuMdoAjOzRGmm6FjMHZ2wCKHlSmSbAHveMnBr0RxgiIBmE0D86qk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xURyu-000LEn-Gm; Fri, 20 Nov 2026 18:01:00 +0100
Date: Fri, 20 Nov 2026 18:01:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Doddagoudar, Susheela M" <susheela.m.doddagoudar@intel.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
	"Lindberg, Magnus" <magnus.k.lindberg@ericsson.com>,
	"Chintalapalle, Balaji" <balaji.chintalapalle@intel.com>,
	"D H, Siddaraju" <siddaraju.dh@intel.com>,
	"Srinivasan, Vijay" <vijay.srinivasan@intel.com>
Subject: Re: Proposal: per-lane PHY polarity get/set via ethtool PHY tunables
Message-ID: <b9785068-b1c1-43c7-be3e-9b8c5d989b80@lunn.ch>
References: <BYAPR11MB27105AFF28337302B1493FFFD2782@BYAPR11MB2710.namprd11.prod.outlook.com>
 <112154f6-53f9-4cb7-9124-aba263b097b5@lunn.ch>
 <CA+h21hq0EqJZFh_Kv64TR-oL4j=n61XK1xzzL_GMXLZr-=4PHQ@mail.gmail.com>
 <BYAPR11MB271098184A7A1689F5647937D2782@BYAPR11MB2710.namprd11.prod.outlook.com>
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
In-Reply-To: <BYAPR11MB271098184A7A1689F5647937D2782@BYAPR11MB2710.namprd11.prod.outlook.com>

On Fri, Nov 20, 2026 at 04:35:54PM +0000, Doddagoudar, Susheela M wrote:
> Hi All,
> 
> On Device Tree platforms, inverted PHY lane polarity is described statically via the PHY_POL_* properties. 
> Non-DT systems, such as x86 platforms where polarity comes from firmware or NVM, have no equivalent, 
> and still need a way to set it at runtime for bring-up and validation. 

Firmware and NVM are part of the problem, since there is no
standardization of them across vendors. Since there is no
standardisation, you are going to need dedicated tools to change them,
so is it really that difficult to add one printf() in your vendor
tools?

> Two reasons a static description is not sufficient there:
> 1.ACPI overlay-based workarounds require PCI re-enumeration, which tears down the netdev.

So what. You try all combinations/permutations until it works, burn it
into ACPI and the problem is solved. This should be a one time thing.

> 2.Dynamic devlink port splitting changes the single- vs multi-lane topology and, with it, the 
>    per-lane polarity requirements.

Why should a port splitter require the polarity of a pair to change?

A runtime ethtool interface is needed to override the probe-time
>    firmware or DT defaults after a split.

How are you going to explain this to the end user? "If you device does
not work after splitting the port, please try these magical ethtool
commands until it works."

Are you old enough to remember straight and twisted UTP ethernet
cables? That was painful, and you seem to want to bring that pain
back. That pain resulted in Auto MDI-X. Has the industry really not
learned from that?

	Andrew
