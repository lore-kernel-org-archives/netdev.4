Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545136;
	b=4dKulkVRfUWrAbA26hzfPMow6tacYW+AimqcLbdBBJuisfjQXTEUjM1PN0eCKue+AKH8
	 qMeGSMHm1E8X70nPAhooFH73cxnbDy/To1WCcnmL4qVNE3Gog8xAVuvojmVWSbRpz2G81
	 sil3UAktrUoEeuqpq/h+m0m85kZY9b74pUkNKzxw5/16pf46RZzZBkSqyIylXawVOzQS7
	 VkMWC7Zo6/nukSQ+kQ62naVJLiLGmPFxRhn/lttMPue9Bc9bgYZSJqo8xznHjenH3bdo+
	 M+0lGmyo7hMSJavHmXPW/SnP9S/y3JaZUY7VOk08pIe859WV0WtZFnDvlyRs46ovBiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545136;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=IJmUFFQXTz5oMi05JYKHeqYz7BsiDZ+RMA67OtUliuo=;
	b=3A0+yQ5kcDqZp+3Q3h6ueUKt9+Q12cPpac0wvlSGzoz5E2pdnDpeUcJ3R2sM9tN/nJ7x
	 Gaga3ShYKmEwegJeK8087BG3MkoR1QzwdVjjubsPRPeeMZWNY2Wdv6V+KBmI37PARCMno
	 15YqQuvAMF1TZ+Lplczv+dHEgq6piv0svkRPV3jUDEgF+DMjRQuMavSDo0Oh0tJMyWdka
	 RLaPeNdcovXLEzzEXSQrTA4YdkR50OUst0EtPyNAZY4XtZoHVMpArtnXdeadIeojOnwjs
	 sNO8nDBwN7q6OtKmJkMAuslvd1ckTqwBs7ZMW5CMkqjEFzwDcYDq9Q8INj14Y/tT9bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=kvwM2oWd;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A41606A31E;
	Tue, 24 Nov 2026 18:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A41606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=kvwM2oWd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IJmUFFQXTz5oMi05JYKHeqYz7BsiDZ+RMA67OtUliuo=; b=kvwM2oWdfY1cHPFyEVKR2PZ/qt
	4ULtfoOlRAc94sLuoTsgd0iA+cgFVI+E2MOaxPQAdpmKAAvoAWvXl+tX9Fu04JS8JCC+POpywTshB
	fy5sk32+U86/JpCz77/gGJChKv/5E6XlvgFyGvBNfF/wDm92OcFSLAOBaDZkJM52S78I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVvIw-0017ve-By; Tue, 24 Nov 2026 19:31:46 +0100
Date: Tue, 24 Nov 2026 19:31:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/5] net: dsa: mt7530: disable regulators on switch
 teardown
Message-ID: <912fbb69-f84a-4c56-881d-aa7b1b5a6973@lunn.ch>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
 <179550875789.4156.10993765506582806373@mail.zgclab.edu.cn>
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
In-Reply-To: <179550875789.4156.10993765506582806373@mail.zgclab.edu.cn>

Thanks for breaking up the patch.

> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>

Do these issues actually bother anybody. If not, net-next, not net.

When you repost, please add my Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

---
pw-bot: cr
