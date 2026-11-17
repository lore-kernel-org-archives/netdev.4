Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873921;
	b=dW3GscjFy2QvzZ7EGwPZlJ6bYZ2nWscRpYg5VkmHzjRDUuYGrPDp4Eu1kb2qEKQwmL8r
	 aIOHSCb04/QU2GrwxpGruXSWk1pwQC22pb7b5en/yhMgHkQ+uwgm9sVvI+EMLt1hxbCUD
	 oMjkeWRw8wdjBbUwYOOYXs8qNHXWQQGQJCwhHGTbB8z39DMGPwjzYLmCjpV8gmLrywvco
	 AqgbfqhTW9+pyKG9M38c7grQBmw4QMJlaLg6zSniUM1zr4dqJNqP6dxrKqTWqDYogTMaM
	 CBe/JEAMHK0pX3NNtuEFJXDOFBM8yx/Q0Gj1PwVRrbo+tK+KNE1dc2aVNALctCtrCcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
	b=sRCi4epOOkXmNWh3GrsVGIpIcrTCzMJFAyVfvwfaTZ7DxTQryqWbVFGMrzgxm/8fklHG
	 rdREdCyAA/69nFXN72GAnnc4hjAZNe5Et56HRO/q24r5Zoh71GIBh9Xu9Z9W5n+rmjhI+
	 3jTgyuJeXAmI8aavK4GTtI+OYVzJgcX0b/ZDrVXxZWqoo4lGhOlyjNQkkSjXLjOR2oWvu
	 aklD6s05i1mrAvjcCXSU8g0gxiTdKf8/8rRMiPkEmi9Eo6X4xQl+5vx77aRwLkIRy3fab
	 T1TC/ZhFABgOlZdawaji1fgByQbbYOh44E9LyRllFIF8fn8VU6FlBML+RQPIBPIDZXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=o+1molFf;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FDA606A333
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FDA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=o+1molFf
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-94937a33cfbso433827585a.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794873920; x=1795478720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
        b=o+1molFffc9e6T9ddIDnNeseSjzEf2bQKujHs4vpOVw4OzSSGS4YQo8BJrSN9kd667
         k9JFBOotGGRYa0PkAFx2E0FiQp1pgsnwgn6pcnUL3Eya4+1ObVIZXwVWtTnGOXsLpAKM
         Qm4w4F5jBIoZdwaJAnrycuNhvr/nMKvlaRPWeoY+KemZwqtCHlIRV3pKlOZAan8ZiPyk
         dg+rWFVtziAEodqueYjujOY8FQIiLOIqi0nCOki4SNuEx/vo4myxz/px2YhfTxnQyYx8
         5SnT2fX1BMMsw9KBqqyDMrnK6kEETUe11lAAN+nPzvpxO9VlnJiaiLVZSGU+NSdcdbag
         q8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873920; x=1795478720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
        b=NK0T4VOjVkk+rm23/tqCrJHPyRUJ9siiRvs5M0atO+RugejCyKiCtXrTjiGX1C8wM5
         uIjAHRTZYHDMo7NlX3Tj7IQ1ePO40AFoMX5TNmo5l0pr1+uaITtBSLQIWMBIQZxEQnb4
         bLxPouG2ldwZlbGAlyZ+ddZQV/9CrW05emJps70pmzI3XPFNFcBjSoWaWIQpahFb8wgB
         wAxWuvm4QX8iG/CPoLaA35fM8TZi/hzLbd4uL56wmuDXE5c5B5+kFq9IBb75jdS21G+q
         tunhnhwQUDi0fVWf0KYqiS3umkLC8mvJSnWMxZUfYxoCmV7sw2+Nwal2cBmiml04Qtww
         /u/g==
X-Forwarded-Encrypted: i=1; AL+hErHl5JuFqERKbTlNJK0yctKD0QV1ggnSI3r2TAfYVzRhwjGF5HjlAkzaCa+5FGNkuE/jrvHoosE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8miEb42IiOpnbF1XElCV8PhkgkI7JeEL9Enc5iTFHTMyjJEwE1
	Les6+CkARvodf8/phhT0TKuTgwp6zGb/O1bV/7Z6V2+PZzqENsZdSIN+eXvKe6me2GA=
X-Gm-Gg: AYBFou1rb1An1sAK9ca/pI4iy4TzKbw65GiqW2+IElNaW5Iadu2AMgaaYwaJ4nDZEI7
	DohfeHlABRWdJwevWEeK6DTqcFcYqv77TVQO9Fx/NM5v9pfXyGW82t1px3Jd5WCGhFS9iVYH3he
	ETb7GW5/cdaM6AAzX1/u0sdTft9hSCx7yKGgMXbKh1JwZzynHxPwF4Gvo26WjLeo3SRfry7IHTQ
	qEzuOND79PJ22YZh9vxY1eVUu6lGDUDkXj5IDqBpU25ujZmbwWabHhaccFANLoYcBAwzEC/JrVn
	xLMeaLd63zqbSfeKFgG7EhhQxsPKSUTMi5uuMW5MTYKgRUbuDaBzCLlfeNGWFaUqYpM1FK8q5OJ
	1FtosU1w+dO7X3cTlAZ9ALFQZI+7khGkjnUSRwrgdZ7tF4WjGQmSiRryH1+YbwrwZ+F9RYRuQkN
	CKIH+2CYyKTgl1x0wLucQUlrNwy1Nt3RB8F6inymKig9tLS5A0ktz4kzzxVYGPiKN92xCxC9XmX
	vqgwtfoVfmxWHVp7+v6TYUppLUQKhrmkZNBTJCVrYXdbGgBssOsf5s6PAxinx1/I3siyT0xAHLk
	PjgJrQ==
X-Received: by 2002:a05:620a:aa0b:b0:949:7473:b1a5 with SMTP id af79cd13be357-9497473c077mr807892285a.55.1794873920005;
        Mon, 16 Nov 2026 16:05:20 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b889csm969866585a.32.2026.11.16.16.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:05:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT6h7-0000000Apgy-1pGN;
	Mon, 16 Nov 2026 20:05:05 -0400
Date: Mon, 16 Nov 2026 20:05:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Johan Hovold <johan@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-input@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v2 18/19] PCI: Replace untrusted state with device trust
Message-ID: <20261117000505.GA2488304@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <d0999161-3b27-4c3b-9d66-1d117c4836fd@arm.com>
 <20261110122237.GG8635@unreal>
 <b4c2538f-8021-4abc-be2e-fcd1596f84ca@arm.com>
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
In-Reply-To: <b4c2538f-8021-4abc-be2e-fcd1596f84ca@arm.com>

On Mon, Nov 16, 2026 at 05:13:59PM +0000, Robin Murphy wrote:
> Even with the slightly dubious argument that this series only intends to
> shuffle the existing PCI code around rather than fully introduce the generic
> abstraction that it claims to, if the PCI behaviour is still just based on
> propagating the internal "untrusted" flag plus the new global override, both
> of which *are* known at add_device time into the common trust state, then
> there seems little excuse for not doing that up-front so that the new API
> *can* just work as expected.

The desired iommu flow is to start out as blocking and create the
default domain only right before driver binding when we have the
correct trust level.

If we try to do that without this series then we have to do it all the
time, which I'm really scared will break some embedded thing that
expects scanout to work or something like that. My hope was this
becomes opt-in based on the new command line stuff in this series.

On the other hand this series works properly on systems without an
iommu, which is pretty much all CC VMs today.

There are probably around 15 series to complete all of this PCI device
attestation. Without everything it isn't really usable, IMHO. I'm not
that worried about the series ordering.
> > We have two levels: policy - that describes the default of all devices
> > for that bus. level - actual decision on how that device is going to be
> > operated.
> > 
> > "Disabled" prevents driver probing until the device is authorized,
> > "Adversary" permits probing and requests the available protections
> > for operating an untrusted device.
> > 
> > Both need conservative initial IOMMU setup: a disabled device may later
> > be authorized as adversary, and authorization does not rebuild its IOMMU
> > domain.
> 
> Urgh, I can be absolutely certain I'm not the only one who is going to be
> confused this way... I see "disabled" and instinctively take it to mean
> disabling the device_trust *mechanism*, as the logical thing that people
> will reach for in terms of "I don't care what this new thing is, just get it
> out of my way and let my drivers work like they always used to; I want to
> disable the new thing."

Maybe "isolated" is a better word?

Jason
