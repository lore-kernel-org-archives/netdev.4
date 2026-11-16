Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859754;
	b=asf//3aC0HaEGRyNnUK6fLFTUK/H37HfTiG0BhQfXgDdaBKZmjjIK4DeU2RVffndESDF
	 5z2e936FkOBoZ3r3c8hrQYMWaaOtv+mlzweGUrOsFRehvoOgJyYwO6aGVNnJU5wslMqTY
	 9/2vurXreA5e70ALaDfgV3ZCNlVGzfKL0wLY0dz3K3nNsqji7riwmiumfCIbTOU8mFSLV
	 iLqC0WqZur1m6JJkC2PRQw2K2fJAX1XeZ61KSk8pAD8EG87MgRjw8PEH/2tsMil5m0eQ4
	 7kC5AmPaMdRNVFXxuj4YBzz2tEfUO9Ckx32Ue95osZ105UVFirNJKjS5EcKdjBX6LMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
	b=JdAAb772aPPK8C1mA3J2DhNSTYU82+gzxY4zb7gu9d9G6CHCOCInzRQ8mWm3DvHS5Wv9
	 /BtQzgMdCCxbVOc8w88GY/RsBioP+3iRawAcM654w0Qejgli5QfktvcyWdIamOFQMa7AZ
	 kLCTNUMDuYJ6F9j/SxOOpEajbPn6N90qnsafUUh9zNiaakXf62iQX8Nv0WEYmymsKqYmw
	 uFuU4dM1Fe63QDTIN6iOXfrhAYoq5rmGlXbkG342IqYR8dlHWu79D6u5RBZOAIZ1QBpAz
	 X9TriejK6Y9eSFa5Jjfnkko+k75ztCzDXoJjLKgRZ0rz/joc0GdiEFvC/pcPT3YrJ+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nbZUyxTk;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC35606A32F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC35606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nbZUyxTk
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-536717a4d83so40754511cf.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794859753; x=1795464553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
        b=nbZUyxTk1xDDi9/JiN9In9kNH24m3xvR3W8MPaMB063K/nb6P74sDih4ebpP83k2np
         SjqTAYuPLCHW+FRVrjLKSTbDX5aM/IVbZZxu+ASYJ/ssH0gDFbMJvSJmLcdHAAsDSEL+
         FG47SOuU8PRulqvpOebFRdp+iKyncNtYeoKxWrzhMSjcb9i+1jD4cThvDUO+7PnMd3zc
         ImV7NXhI8pI4k1LW/eM2oLltJhXP6hUveoFekGEVH6+oWgooyZkYdcVCIAs0jW9hoXxW
         5IGbSHDAmwoeFMTug5VO+bv+VKknP1f2hoIrUsvWYeNqALAO8eTePO8ZOjSwRNnR3p0b
         L2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859753; x=1795464553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
        b=z7xBSQ0Se3QJ5TVTdmZaO9k7K9N/mQvi1ls2IP8s5/xP8Q02JNIGFrMcNBPOmoesnq
         Bt2bmSTIpOPL7gmJnnzOFWL1aY+I/ReFmHpg77M8u3piuJeclslwMt6zo0F3za9X8qca
         U7WUXrJlYji6dEC1lHygmKbnwh2VPH2JKQD/bNYISg/RdjayqnHpjxtN85BHaVPnoAG0
         2P5ESojKgpqgmlktSBFohFKMobSN0JsAOHSQ0Mt4eejZH2mcrMPk7eU2Utq2uBeCvbkB
         3XOiNJj86+KI9efL1exwlcSeNTkAM3q22Xr0ijxFUhiKzmDUwm9u3Z59qc1rtUfWIGIP
         z5qQ==
X-Forwarded-Encrypted: i=1; AL+hErEQQ1DnCuJuGXP3zzkiH27NlUJMU119wyZtN3zO0H8eyABUXzamgvEPOCoUzqKU2paO1LH/bnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z84Eez/yJwJmhlLyMv1z++OYkAXTrQ/6o6ypGO+9chot6yUc7FP
	Jope0hlAQ+NjNnuQLzvRKvdwbTyDf4jlSBHZxrhQJk9VCN6gw3S8XuROIlV8+26RsWU=
X-Gm-Gg: AYBFou16CGN5eKc7zwTopsEzO/O0QZ2iITBMOBIUmrK36RBk/iHu0VyoUjXUWUQIqYD
	UwURyMRAKJj1pq56DLMivt0zhSUihA1PrzBgfiJ0Xa25ytuzoMz8R1aTmOARInXRXaNH5KwF1Vb
	2QI/WWyXUtvtoXHAjlRT94pTCeeYR0pyIfjVqPKVi1va4lhC0OoX4CnOJLYiFjQVPzH2jh9PRSK
	QDrjdYWd8DnmPZvdvlPkDCcMqb376fGUV3gSRpiZXqhcnmBQ4GC/VMLKZVxQEVoLMfx/sK/Jbag
	4T9+KjFxKW5ELUlCJQSVYVFsqBNTzW4ArxCr85BxEK3upWFpADrWVF9mY4R/Nb7M7nVj4SZfV4+
	savnFkU0RF58jD+U6KMnikEtez/w3p7iyXainULTZ0RROe64VfdtFNadrr0qzrJ/sUERm/mmqcz
	UJVSsRroUG4cZxyftxN2KLpBdpFGbBg4YTCZkgNWjnRgucpebAqtJVUwnmSV6QL/nwzujx0b3U5
	p0LmNy6T2j/cKxanZELlokvoe/LmS42riKLz4usoV6T6y2H/ajvlgHxN2IyRekYE0E/N/Kjk1f+
	1BPu+A==
X-Received: by 2002:a05:622a:5144:b0:536:98da:f790 with SMTP id d75a77b69052e-55ac43909femr187873791cf.6.1794859753196;
        Mon, 16 Nov 2026 12:09:13 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d445d1sm92856046d6.8.2026.11.16.12.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:09:12 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT30p-0000000ANtb-30lh;
	Mon, 16 Nov 2026 16:09:11 -0400
Date: Mon, 16 Nov 2026 16:09:11 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
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
	Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <20261116200911.GA2473219@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <193e4130-9c2f-4a0f-b218-f5fcf0b3d508@linux.microsoft.com>
 <20261116190417.GD2299285@ziepe.ca>
 <2965c691-82fc-49f3-abdb-383860f6e82f@linux.microsoft.com>
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
In-Reply-To: <2965c691-82fc-49f3-abdb-383860f6e82f@linux.microsoft.com>

On Mon, Nov 16, 2026 at 11:24:17AM -0800, Kameron Carr wrote:
> >> My scenario is pci-hyperv in a confidential VM with a paravisor. The
> >> paravisor is inside the guest's trust boundary and owns TDISP. It locks,
> >> attests and accepts the device, then answers a VMBus query describing
> >> which BAR ranges are private and whether the device's DMA may target
> >> private memory. Before a driver can bind pci-hyperv has to:
> > 
> > Sounds like a user in such an environment just wouldn't use the trust
> > level mechanism at all.
> > 
> > What use do you see for enabling trust level but having all the
> > devices unattestable and accepted already?
> 
> Previous iterations of device trust used the trust level to make
> decisions around DMA bounce buffering, etc. Is that no longer the
> case?

It is not, this is now just about userspace attestation really.

> I am looking for good hook candidates. I was hoping that trust levels
> would end up directing DMA behavior, etc. but maybe I am
> misunderstanding the design direction for these trust levels.

I don't know, I broadly expect some flag in the struct device to
indicate that it can access private memory, but how and when hyper-v
could get involved to set that flag I don't know.

Jason
