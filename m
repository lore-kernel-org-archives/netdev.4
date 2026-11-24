Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545769;
	b=Notmd/MeNo/dmoK9iFkT6RZI9u4eDGJjCfZAwUy0T3O2Gjf2dZJFDqgiCt7cPlra0W/W
	 yLIviSltsWZ36Q70bmo/lmVYDQcRQSNl7jJdtVuEr7cdfYHS3qALIcmE/xLikg7qD5SrW
	 Zy8SCKZpm/mRrPP16jCaFqnB5loQmcxXqdnM3qJImEZumZtvVp5JWgiOkMbkoOZdWd4QS
	 vpsR3upS+3BmbABG9UNnoSoiaN2zEjxuujKvbeR75OUsJTWxX1+VabQltdj3eBbTaQ+Op
	 pND3am6wFzvwEKmhaxc9sZ0oTmLRvJAkxm7vqpJBZWNmLFR1uJD8qYVCLIn3u+ugfZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545769;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=MIuIK6OTrAaRf7WvqeRgQl00U2uvIZ8xlyhNJbCOjz8=;
	b=TKCE5yUFYaWG060uAMct0ZAMNajptZuOAe/mNWOMqP0/apQUezQCByo4IUN7ape5s5W5
	 A3E8BeTpjmK+P14tx4rvaIKVvQMYm3QmYrx8SnFFyt2Ae1lNg0WgFtMbt9mX/nNnJpfN2
	 cNmMo+ALSGd7AQPTT09a9VJI9YvE/+kRYbNWbHhiUdjgiAYDqwLCgSKKQA005QsJuClBp
	 YIQhGwn8bLhMqZtlm5b7KCuA83rRlk6TWut/MZPsWukNufhR8sDkdnLOGLNAxkveySX5S
	 Dmez3w9tz+gZctx9REsG3iup/YUSRF8RZVzLBQFEguFqwoDCZD8a4ML9q9pYgDG7cFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="J/8hRVbb";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9063606A31E;
	Tue, 24 Nov 2026 18:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9063606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=J/8hRVbb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MIuIK6OTrAaRf7WvqeRgQl00U2uvIZ8xlyhNJbCOjz8=; b=J/8hRVbbPlJPInpoIKtpYnZtsS
	xcHTlKumZX31T9wKrIf1XWA2NUpIOlY5GDutg1KsZBx9byN0hrb5IYLSnGw+tTfn4xexCYYSe5Mhb
	S/MZcztXgWb5i5Q0v+VvUZaFqwmAVJKRM65x9KoukWc7a1A7DwZR14T875hiaQcWuXf4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVvTM-00184Q-2v; Tue, 24 Nov 2026 19:42:32 +0100
Date: Tue, 24 Nov 2026 19:42:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 4/5] net: dsa: mt7530: disable regulators on setup
 failure
Message-ID: <d31b32a8-cbc1-4649-9a74-85a6d479a8d0@lunn.ch>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
 <179550875790.4156.6284290287819341762@mail.zgclab.edu.cn>
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
In-Reply-To: <179550875790.4156.6284290287819341762@mail.zgclab.edu.cn>

On Tue, Nov 24, 2026 at 04:25:57PM +0800, Haoran Wang wrote:
> Once the core and io regulators have been enabled, every later failure
> in mt7530_setup() returned without disabling them, leaving the rails
> enabled and making the regulator core warn when devres later puts an
> enabled regulator.
> 
> Route those failure paths to a common error label that disables both
> regulators, and disable the already enabled core regulator if enabling
> the io regulator fails.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
