Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545506;
	b=Mk4gDQ26U8umabup1ryqROVN1zX81tijECl4Ysp6TMLMvrXd3byv4SqK7tPERTMQ8Wwf
	 vCdf9OA4FnYI1SlRBEjwHXik9gf0fEbGNMo0a+4Io4l8DoqQznR/SIWPwPOuFV9tee5k9
	 M5ArOtj33UUM4YUYcI98EWG4G9Ezl1EDzNqFICoAc6Rsna7ppkV1ZLjZmtOSmJifet+0O
	 O+ywsgQ7V/DCp1CLrV6jXAhvpkES/aEIDA7oU9BYRyM3TF8PfTQYypdn/L+K4SIjl/xkJ
	 leYt8FzXTLcXezLInVzCxjMyeJWtAt4OoEuxt7TTgomXVkbU9nrUNfL1chkfnD/w62w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545506;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=p+agDox9kVQ83fzlX6/BiStaduoiE4kUc+zWt2GTCa8=;
	b=ZPcWKSTz6s/o6jRzyn71j8lsjd6gHx0XmcvCGh290TUngzr7PFJAkZxAO7q4axJQg6oD
	 PAuPhFKXT5h1keXJ6zohaov0b2z/QUEn70a6w30Oavp8/EW1wwII8M/JioetpR981EBi6
	 AYeMv8qSt4YR78zBvOdRG6dVN2LJKamoy17N9YX6tX7VxSO6dNk0TuZGG/2YQ86EV9MDr
	 vkmL+Wd55iHPHqnVu2/VuSvDo2VPY7xRFvs++2v9Ixe0suFKOLhGzrsVdDMMfQDZ6+JYA
	 eYJ1T6dhTjzLC2N9yF0sgebv/3JrWhNbG45AicQdONtMrH/BNoRxKllXrX1NOAS/7aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=q8HaVf5u;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A122F606A31E;
	Tue, 24 Nov 2026 18:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A122F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=q8HaVf5u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=p+agDox9kVQ83fzlX6/BiStaduoiE4kUc+zWt2GTCa8=; b=q8HaVf5uZYmkddjTchpkhlpBqO
	Df6L98WUbTOOSPrmiWomdz5IRkDogZWLGIvXNGw/Fu2/2ohBCXoXhi2MGcadLjjoOyfOoqVIa3cxb
	gTuAH5Q/5BG9ZBjoEChOVGDKPQWYdBiGZbJBoClWq1x2TpbX7818HaxNXNa5GBjs2rj8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVvP6-00181E-BC; Tue, 24 Nov 2026 19:38:08 +0100
Date: Tue, 24 Nov 2026 19:38:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 3/5] net: dsa: mt7530: register the GPIO controller
 last in setup
Message-ID: <0159905c-44ab-46b9-b8b5-337b2aa4ca91@lunn.ch>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
 <179550875790.4156.7464757884919680732@mail.zgclab.edu.cn>
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
In-Reply-To: <179550875790.4156.7464757884919680732@mail.zgclab.edu.cn>

On Tue, Nov 24, 2026 at 04:25:57PM +0800, Haoran Wang wrote:
> mt7530_setup_gpio() publishes a GPIO controller that userspace and other
> drivers can use immediately, but it currently runs before the FDB flush,
> which is the last step of setup that can fail.
> 
> Move the GPIO controller registration after the FDB flush so that the
> controller is only made visible once every fallible step, including the
> FDB flush, has succeeded. This becomes important in the next patch, where
> the failure paths disable the regulators and return an error, so the
> controller must not be registered across a failed setup.
> 
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
