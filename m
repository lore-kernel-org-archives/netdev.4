Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710814;
	b=y4Sv0tHCegSgRTVCwekqdh8TmdOt0VoMK6HRQdmCv7iaw5QHoGHq8RRUVrQJQU6CyGWU
	 cGVFuiHS4mmqgP07qYANr3PfeYTSLHM/7nSVlREVSorBBFqWixvuPykkOMgnl0eh5Wnay
	 ryVudWodHetTU4aM1AKDgB/7qxb9VyhPzEq6N8f+MMsS9YlqVkWL29XfBYbHpqpBxN+mH
	 NgU3Vl7dxGgk9Q/kz2W23Od6Z07XiWTexDiav7TkFYRk5QxoTCG7EAl3PcVqbowLNC8iD
	 qpgQy/0MEGlEV0J5tbP4ziI22wsZKImMtxt096MebkRU9wiiDl3n9NkaBgjmRDanQ0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710814;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=UJ5muKce6pmVVsLtnOrlWcbQ58D2znBYPbFfr4QPuJ0=;
	b=g/fqppJBOw17L71iN6Jjjiu2jkKhAaWC7VZEJqds2rz/tfba4BPFBzgC2OdyEkSgIjhc
	 owqvyGzCUJ7Mmpco7pSVFaPtJtQrQIASFE3IqFrSen03oJEqPXbeKPtp/zGBPX4y/nYF7
	 4zI8KDny/KE7CEyfnuBkDb1dyZ9Ke9atPbDcNfkFxozH/j0xpkGX+2TPppb1xklLUL3IM
	 gAXPdMkg0XoSr1C3H+LQ0ai9wcLtqfd3zGvxZeqWWDdUCO4JGjgrKyo23+it+9WNLpLs8
	 s8HqmKDmJZOYshIbDpVSx3E6Q3i90BtuaikUI5SRFa2nejo02k6GOTLcQn4yNajznkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=W1YGLjlo;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EAC606A326;
	Thu, 26 Nov 2026 16:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97EAC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=W1YGLjlo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=UJ5muKce6pmVVsLtnOrlWcbQ58D2znBYPbFfr4QPuJ0=; b=W1
	YGLjlo6Hr9iiyLPpwd9AFxr0JI7gxLOeuyXQvob0/4+4FJW87OPAzLOjId3T2bKIcXVPs7ZI+W/Tf
	ChiPpyeHEUm2FM3WzEvBla2ohPrymwCGC0axyq2j99CgNKUdXxXkKzZbJjUQwnG1hhajaIe9wA6jX
	CarpFCCsbRjKDuY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWcPW-001cO4-32; Thu, 26 Nov 2026 17:33:26 +0100
Date: Thu, 26 Nov 2026 17:33:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Albert-AL Lee =?utf-8?B?KOadjuWutuWujyk=?= <albert-al.lee@airoha.com>
Cc: Aleksei Sviridkin <f@lex.la>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Lucien Jheng =?utf-8?B?KOmEreelpemInik=?= <lucien.jheng@airoha.com>,
	Wade Chou =?utf-8?B?KOWRqOaWh+a+pCk=?= <wade.chou@airoha.com>,
	Will Lu =?utf-8?B?KOebp+e/lOeFkik=?= <will.lu@airoha.com>,
	WeiTing Lee =?utf-8?B?KOadjuWogemchik=?= <weiting.lee@airoha.com>
Subject: Re: [PATCH net-next] net: phy: air_en8811h: use firmware loaded by
 the bootloader
Message-ID: <451866fa-b8b3-4546-9c79-4a7530985be1@lunn.ch>
References: <TYZPR03MB521343DB5E35A9FDCD2FC184C7422@TYZPR03MB5213.apcprd03.prod.outlook.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYZPR03MB521343DB5E35A9FDCD2FC184C7422@TYZPR03MB5213.apcprd03.prod.outlook.com>

On Thu, Nov 26, 2026 at 09:57:20AM +0000, Albert-AL Lee (李家宏) wrote:
> Hi Aleksei,
> 
> On Mon, Oct 19, 2026 at 04:33:04AM +0300, Aleksei Sviridkin wrote:
> > Lucien, Albert, does Airoha guarantee any field in EthMD32.dm.bin or
> > EthMD32.DSP.bin as the firmware version, at a fixed place that will not
> > move in later releases? Without such a guarantee I would rather not
> > compare versions in the driver.
> 
> No, Airoha cannot guarantee any field in EthMD32.dm.bin or EthMD32.DSP.bin
> as the firmware version at a fixed offset or location that will remain
> unchanged across future releases.
> 
> While reading 0x3b3c currently returns the firmware version, there is no
> fixed offset within the firmware binary itself that can be used to reliably
> locate this info. Therefore, we recommend not relying on this register 
> value for version detection in the upstream driver.

Please add it to your TODO list to make it possible to identify the
version. Without having this feature, you force the driver to download
the firmware, which is not a fast operation, just to find out it
already had the same, or maybe newer version, already running on the
device.

	Andrew
