Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179391;
	b=e4dRp4ktKMWc2FMYnahRBtCz1Cn1wRqDS2KyA+0UuzNUgnuvd5Jr6zQWsK+6WNcimVBa
	 sOEyO4zslXTPc/FRGssF9d2zzW3LSYRdvSwafhV+I+7azZmQ1zNP4g8ABB5cw9LHy7mcB
	 BJ12bRigobvjuO4U6i/FBK1U+KCltLgJ+VatkUfK8uuzTpawN8MnPUM0yxw3mp58eQzqn
	 62R2QHi6nsdMlifE2d5d9TNLHWHFsEVZgty+SFjMHrcGcL7VVrXMcWijFrGt75ChvEhXB
	 YCjAmJ4n7ClcY4ONpJi1FXFPTYBcDV0HzuefZE0w9fhNhygIZWkqIA/vFqNt+ZHLpiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179391;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=QQVPMJtHgBSt1RGEs4QTbhObG77EwKUDsV18b8R8cpU=;
	b=YKhQtddBm69WKpgx4Xnqz3e0T95oOTikPu67ko6dUp4VoAOcyfRpEGLtudRiFzp1RQrL
	 1gmPkzHVmTJVYuDacw9eKn92jy6J1LEWjfUtvmD6AykMZ42IdSErvPMrTi0RI7VuwN7wn
	 egqZ5SsWOCR5tvFoykrGQhlWnEt1dMhkYG0gHUfMY8xqADbiSNWZfP9S9AOxzbfy0+V0q
	 EGgHOqqJNH1lEvZLFQCIWJzHCO4P9jgf3yuXm6xwFaOfL3jTkrBF/wRRkzxAgqW1gtIA5
	 mRPgGI+nG4BqyfNQ7NxFR4Gh9a41xWrpxeZVyylGFuOczrj0ZShF1uPwX8+g0RW6HJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=O26MBvPJ;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DFA606A32C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85DFA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=O26MBvPJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QQVPMJtHgBSt1RGEs4QTbhObG77EwKUDsV18b8R8cpU=; b=O26MBvPJ5SHbMr8pzxyUYoPDL3
	T0IhK3p7cg1kBj5MVYl0Y36n1Vo2sm6aQIJFORNQa6lsbaiDx3f1xXXgKu1c0c4nTAGfuedjhehnw
	mxFY2ybNc3uK9nW6LIF1vpZFKx5qQOHCWnCI50FMScxu22RSd9Leq9yjtliRS5roDPdQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUOAH-000IBZ-Aw; Fri, 20 Nov 2026 13:56:29 +0100
Date: Fri, 20 Nov 2026 13:56:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	kabel@kernel.org, petr.wozniak@gmail.com,
	maxime.chevallier@bootlin.com, olek2@wp.pl
Subject: Re: [PATCH net-next v3 2/2] net: sfp: skip PHY probe on bridge-less
 OEM SFP-10G-T revisions A and B
Message-ID: <8955d9e9-d7fd-4bd1-86d3-d128fbfcbf30@lunn.ch>
References: <20261120063756.3677554-1-pawlik.dan@gmail.com>
 <20261120063756.3677554-3-pawlik.dan@gmail.com>
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
In-Reply-To: <20261120063756.3677554-3-pawlik.dan@gmail.com>

> +static void sfp_fixup_oem_10gt(struct sfp *sfp)
> +{
> +	char rev = sfp->id.base.vendor_rev[0];
> +
> +	/* Revisions A and B of this module have no RollBall I2C-to-MDIO
> +	 * bridge (on rev A, page 3 of the 0x51 EEPROM just echoes written
> +	 * bytes), so every RollBall command times out and the PHY probe
> +	 * keeps retrying for over nine minutes, holding rtnl_lock for ~20
> +	 * seconds per attempt. The PHY is not accessible at all, so use the
> +	 * module without one.
> +	 */
> +	if (sfp_strlen(sfp->id.base.vendor_rev, 4) == 1 &&
> +	    (rev == 'A' || rev == 'B')) {
> +		dev_info(sfp->dev,
> +			 "rev %c has no RollBall MDIO bridge, not probing for a PHY\n",
> +			 rev);


Quirks don't print anything. Please change this to dev_debug(), or
remove it.

Otherwise this looks good.

	Andrew
