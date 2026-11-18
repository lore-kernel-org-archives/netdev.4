Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972483;
	b=AwHnJAGmtUJ0KmeO25g5NLSyjPdtkkoNbBn4nLAVng6rwJgJqlUc1EJ+SVp+vGb5Er3a
	 uDJ2MkeLqz5kAW0Ycdd4rI4BQaH7jN4cXZjmjteCG3lr/eC8I5tgBQYHTJ9de57kqhwS7
	 ze6F7CraAL3QVpuUnTuQwNoKYG8yBl4BMAuVtNO9iuHRJkKvu1XucHk+N0IsXEYyNLd8a
	 VTGwXrJWsX6PBzJ6+Z4P5aEZWuYdfqudmU8ac0uQH6MpbD5QMAlxhT1ZfEQodZB0Qp28g
	 fgXaIqLv5/4gtDT+w+6vTN5fwNYVyNeeMQa02QsRFxAgoUfJtos47NcEUyZuEsaGqLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972483;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Mke05ZHG8a1w+omTjMlurTe0VhLIpergvKWiQjIpor4=;
	b=zvz3l1ZeSIngCHyl0XZNPyn6Jo0ApHdI0LgtXjh4AgDsc0c+vHtcIBGJ5gW/ZrolkQNG
	 HTPAzXNhVmXXntQTbgGBwFlBlhD0zv2Fxv9zpNBAXFidN+b920J6YNLNC2A20qqDJji4M
	 y2wLtzmkZqeNXfsFT7K0j9IVkYbqIdZLUziOvvkI+wOU03lAocnp7r6I/WIiA4KcEfvbd
	 AG/lXJ5Aaldl+Uus9Qq4+KshKpjAERqVDIwyFkEhkf4+LH/qnk/ItKKdw3o3EnBZ7mqIu
	 2RGaMEs/uq7tG2HxpxjaYPwyNp18plpBRTBpP0CbVvl8c6YHzx7vTKMakArlhRt+G2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aqHDmMAO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36DE606A31C;
	Wed, 18 Nov 2026 03:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aqHDmMAO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C3C1F000C5;
	Wed, 18 Nov 2026 03:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794972482;
	bh=Mke05ZHG8a1w+omTjMlurTe0VhLIpergvKWiQjIpor4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aqHDmMAOrttJrsKNLHqHDJSQaGoLb3NVNAzWChOnoqr5oyncnUnUsGIgOQRUsyPti
	 6A7s3/HDI1t0q8ASfkzpBItqvNTSHHCzUS5osZQhKP2wLZb4Xc4beE9yPTV/8OnQxL
	 001tt4U2HxxS7CDkoDtKno2gwYi/NegcnD8dkYneMDpGiMIgXeqkCLTxWY1Pe8F+UJ
	 uIxcMZLqKrmYqYqUYSc7i/y8njoi2OSM/74m0Or42qPH8h6gNAO5c2x9SeHRZ9KkCH
	 x9ZX4GLXYMHBre73MUCmrxCDFnzaaS5KgGSCivn9U0hW5cfKolQf9mLhMQcU/ZV8db
	 xxOOpCiLNk58g==
Date: Tue, 17 Nov 2026 19:28:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: github@bumblecito.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com
Subject: Re: [PATCH net-next] net: sfp: add 2500base-X quirk for ODI
 DFP-34X-2C3
Message-ID: <20261117192801.0d76c865@kernel.org>
In-Reply-To: <20261118025602.171615-1-github@bumblecito.com>
References: <20261118025602.171615-1-github@bumblecito.com>
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

On Wed, 18 Nov 2026 02:56:02 +0000 github@bumblecito.com wrote:
> @@ -606,6 +606,9 @@ static const struct sfp_quirk sfp_quirks[] = {
>  	SFP_QUIRK("HSGQ", "HSGQ-XPON-Stick", sfp_quirk_2500basex,
>  		  sfp_fixup_ignore_tx_fault_and_los),
>  
> +	// ODI DFP-34X-2C3 XPON stick can operate at 2500base-X
> +	SFP_QUIRK_S("ODI", "DFP-34X-2C3", sfp_quirk_2500basex),

please try to keep this alphabetically sorted
-- 
pw-bot: cr
