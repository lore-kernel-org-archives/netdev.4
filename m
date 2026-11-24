Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545324;
	b=Fxzgst8xreRWDmIYgHl+awdnxUbogmT8Dt7HS9oe8uvUDwKWdK60ZMIj24AnLp0W5ULE
	 3DsAmU+SYJZqRbFwkh69CahsGBjy3KIIx0W52SK5n4XGsN3ZwqNyNAZIDjW0QFNM3HNE7
	 FjzsCLOqQinYl9+l0buqLSpHF3wrCk0TGgQ7/2UFTOR5d0qQFuLvJh2r1HG+QPlS7D3gE
	 PSY/ELWjljkfuUHwuqLrK7Lzh7ylPwBKkc8w7roXv6A6c00/ihg6kOhpivpOAvWK6T2dW
	 23N6tG4XCvEcT+ax0vTeWagQQ8FHs//o/kO7r/eInqmLEt6mtR/Dj/taVMKpKU/VzLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545324;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=NrprG34boI04kXZ9Q38+5sflqcdYytZcE3UW4XNCMJo=;
	b=w5MiRzWg2W3bFhpVgll1sGZQl5WiPF1oiSRh4OvSAKPzVzoDqUKXXCGGCOXuumplaqet
	 iYenpc2ykbl5VrLMQXIljyuoSqjeODz6XUxBMjM/sLyoAKfWJDtRQHXmpcVURGpHkCCO+
	 Az/OnaRM4kw1Ebsse43cn/FcgI1kw1Xn25tTx0T4ZB8+Q/JffDg7K1hh4wVxHqo6luP1e
	 ySL5nlqnRca6L9c7TihemeoDXkEeeXhZXhF2W7evR5kq1Cjh/8vaAQTlx18SozlIgsntE
	 9ubIzWEdutl+GX1/A02FjFmbhIr8fQ23IHrHNSJHHEOqVq9iIsgcgBobOPzRavBLYOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tOVWl4QK;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511A4606A330;
	Tue, 24 Nov 2026 18:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 511A4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tOVWl4QK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NrprG34boI04kXZ9Q38+5sflqcdYytZcE3UW4XNCMJo=; b=tOVWl4QKpscERkcaHBZZlNGaNx
	NOymZFBpt80W5ebSC0m9QtHoie/kbWj+asymVOUSOhOWBInDFq5tWtMk7W4u5UGycHD5AfaQfxbX5
	IDc2cVNRiwD8QlcbimQGn9eRK7umXUN3MRIzSoP3Lef5BgxV0P3hZne6/wJIR/7daN4I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVvM9-0017yD-Ig; Tue, 24 Nov 2026 19:35:05 +0100
Date: Tue, 24 Nov 2026 19:35:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/5] net: dsa: mt7530: factor out
 mt7530_disable_pwrs()
Message-ID: <a86b68ca-83e3-4d0c-a655-bc2574bfe8c2@lunn.ch>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
 <179550875790.4156.10911645527208536694@mail.zgclab.edu.cn>
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
In-Reply-To: <179550875790.4156.10911645527208536694@mail.zgclab.edu.cn>

On Tue, Nov 24, 2026 at 04:25:57PM +0800, Haoran Wang wrote:
> Pull the regulator disable out of mt753x_teardown() into a helper so it
> can also be used on the setup error paths added in later patches.
> 
> The helper stops reporting regulator_disable() failures. A failed
> disable on a teardown or error path is not actionable

While i agree there is no need to add code to try to recover from the
failed disabling, if the disable does fail, something is wrong
somewhere. So we want to know about it, so it can be investigated.

I would keep the error messages.

	Andrew
