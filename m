Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100952;
	b=MokTVYTgMz9mC/zNc1B4Z6Pyq3IsG/3WEQUe+GZ6XfUBOz1NsbSnc9ZYTsUKV+TGcp4L
	 szSzt/c5M2dQR3Bc78EiEHohBSowYqHM3RGmkg+8rCMZ3PtxkdOwAWUPW0vgcLxNzpl62
	 g37If3+a0kTwTzJ8dICH2wKYfunkfVfd0wGvHQenjWnO2j6zZ/0iVBMqZTGX3kDP/i4rx
	 yBj6HVgjK/FomdsWo/w1xDsEkNECdosXvJ8soXtbN6/eX5XPJYrPk8mLV4awZgfyLUEFA
	 UlWyDz6esjRwQ7uw0BcvYV9uAlgHjWktt5tcmFDaExJfBmlvUZl3w++0GiHRa78JtLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100952;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=95O1hAVf4NX4xcv4/2PCB3dB77b5Bx8lMkGNIBLpcJ0=;
	b=D2ibPRXQw2Q5pgT0pbA4PBu3Cn9PLozf3hcoHi6tndyGoOGT0TbhHAyEiDaMSk916bu0
	 qrKKx+N48JwB/Ofkt7ar2K19yyNuUUlmuvywIfY5LW5FVQM7z3T1WnbmwEpmgJyuUlsMx
	 QayXAqqrwZVmcrGctzyyDk1yvXwcCxJzy+SLcyfuNV9D+52GaYIX0NjwkjU7KHLm+rwrg
	 fWJYwvBA+BT+z79W99sd+nJrBkRSvLhihoo/uGbe4pjV1/nNsMC9fOkDZ5stFEZ1hGBvG
	 lvJX+xHKJO9CarWdP6rOFtHzAP/OuAFbbZam5wpEu7lcjnZk3BfixMYcTAYRJinXEwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uioW5R3z;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB13606A320;
	Thu, 19 Nov 2026 15:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB13606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uioW5R3z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=95O1hAVf4NX4xcv4/2PCB3dB77b5Bx8lMkGNIBLpcJ0=; b=uioW5R3zu7p/h5XWeQCkCg4SAn
	TrlyNatcVx37afiH3LAiPh20Y/5v/5XrkfScsRhklEjWzb3n82SIC8WsJJypI4tkfBh1jzzGS9gZY
	qpJkeR7kq4U4V+AbX1MauctFUxhk1PHLPaH5hScKdRIp5rK3c3XKgMLnj5HV6v18p3gI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xU3ki-0003yZ-HF; Thu, 19 Nov 2026 16:08:44 +0100
Date: Thu, 19 Nov 2026 16:08:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dsa: mt7530: disable the power rails on setup
 failure
Message-ID: <37b97f59-d37a-4ede-88a8-6a70635a3019@lunn.ch>
References: <1795076103951-10-8fa23d94@mail.zgclab.edu.cn>
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
In-Reply-To: <1795076103951-10-8fa23d94@mail.zgclab.edu.cn>

> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Does this bother anybody?

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html


    Andrew

---
pw-bot: cr
