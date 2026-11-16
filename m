Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844785;
	b=nkZ+xap0jdWtx4FslUUCwpXH3UQ99EB5ak1i8MrfJ+wkXtCoFSfNT9m0MIsTac0IpCZb
	 VboHmB1Gov8DssQ4tvwQS8Il1E8ssbVcVuzLWZu4WH0dlQgRGx4r3FuroQHPwF7AvW8LG
	 3Bz1OufQ7lGsuWNcQ6NU7WTCq2Q7ZLyPDZ9Wjotgt6+Dr3uMHp5nxY1qUaudej7fm+anT
	 EJ2hX5e/tIjeTKE1MeAxoKuycOgUtLEXVo3Vp2YcGfsKJFB1z7LAkShHFo98MWycje9oU
	 NSxbHnc/QlBZ9mbGnrAKFtfltfa8/+ty8QXd+yJ1B314O+FLw+bjX5Hi8YuON7baZ5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
	b=pO75/AHKSR4TU3X7dQ4Dx7RaJWXhighr+JQ95zAkZtV1xEPOH1JQYGcaJjxOb4av1uEr
	 PocW9XHksfv8pTJMjs/PpO8HQ+fDwb+8AdWfullAo63g99IbPPePNv2hbX3drAiNnk1QW
	 cRsM1LuAUqRqpuyaCLRfqFLJotd8CnYS6ddXkKEZR2+vDqNv8jmWE7ZDR7uQnQoo9/y7D
	 D8oOcXhgocL/w/TBfa3o4H934BovLhjE5TVPCrPQA0n1f8pZubAk1m7flGeSjsvouEtGC
	 wnyR1yoG7vQOAy6eFvvy9fdTxFgqeSJBDUtAp5tV78WtDm2rrfBqARD3yGY1tE5wygA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="T4EaFVj/";
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B900606A333
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B900606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=T4EaFVj/
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91eb7d1478cso45211466d6.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 07:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794844784; x=1795449584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
        b=T4EaFVj/Db2Oh0QQIN6fEsneaLWasSmYdaomNevHcWQV9XfC0eku9uiWRA8yiTc/gq
         beN2zhlEBUDpPwvlJXNnJXYG7SLeGP2RUl/CIxz8vHb+CRPGvwOGP84P37zc/ASqwdCv
         a2ZImH/j9PEIljcRTrH9YjQx1m9XzvHX9w4v1GGAYhpr16oDLUf0JwGEJPe+tOCosZjE
         d53ULE5uBklWCIuWvycUfx9hIvJ8w6anXEcNacgC3MbLl4k/Apkhq6kLpk0rmKpAkcTv
         Trqjo9GQ8ASe6EH/m27mrq6sK/GeD3Uc4wVkpatMXBaBSojYeEkRpq+DgrGx3awVmJv/
         hg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844784; x=1795449584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
        b=RwgEA+JgC+MSl+OTqOCfGR4wIoCynfHlIicU48Fpz7/WjgQmQ8r0o4HrE1lQFhXZ+p
         2oG9QI8zj3ZImpXktbxiAvb6MpVhJJEOcIYOpMfaO2u1KrMfSM8z+eW/iTrWXyOmnUbb
         KsXSkGPvihfUJ0r6dkOjRLqdOHdUtgO7fvnU6iEnS/RJsOe++aO/f/ADmdMf+HPpT0d/
         SGw+1pdh3Fiqeu5YVOVDX6VtiXfCx9isCQu2MHdDjrK74XJMYY2b4pVnGv4jnuvBtqvW
         2Y5df/rq/m2AvPHhP3Or+DviSBQX/2CJzggwDmqrr/rW9CF1DXMASEbChZvDb4ayo2UG
         H+UA==
X-Forwarded-Encrypted: i=1; AL+hErEhuGjM5p/ltwUrfRCVMiXfVl15s5Z9fyCc/GFVqeBrx1bdvliDZEyJZ7N1QWfcgTeFjy1LQTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U0UjMRoNi9I7XCSqOuEQCbYaXAS1FNM6xs6/tXki/WyGKwoSZ
	wKRlNsuvNGYYWofXo7WrEMFP5v67d3dxS592ydOQClOfBq3F/K+ier8XQxwYIcWDXpM=
X-Gm-Gg: AZFdTZdULuTTEZYMx1G7n4OiJXjn3xWwps0l7HX6+1xVHPyWGsw95ZQerut/Ym8aByR
	YYqgCK1grwD01U8YBg7TNjH3UKvtwnw2z1KksODI9kbNrUS9Jt3Q5RiE338R2+etXFYTpxI1XDW
	JE4bcrgh8MoLZIZvMnctnUcEttjCqxY3ipCj5gJCLgc1Y9GYoKlbuSJ5OxQX+Rp4fokuUMfJs0y
	w4p1AuHJkH46iWfAuiYj6yyWZb7FLZyjEnCoxoSAHKVxE9LGZDPzFblpEMiuDcGTTdYEkohPX+h
	Kk7x5M83sJUpNpZkBzLy6JxdvGp69oDgH21vOPxtxQMk0lsRin8jLSqjEX4/p6InCEQDsUyKBxU
	9+vQ6a37MhsEKElWjkPrcgV3xZ3XNCo/FJd9cSduyc1FpV0zi0RAYKwkYFJs9rJOGKwv7EJ1i63
	C1qm1Yd0CMoIywr27q1ggeqDIehySAU3NSjuoWF4JLs/7AR+Wr8mrGe+w87+rSPPme6skLqpDKT
	sp07vrmFigH2Uf/40Ke/Hf7MFAZSrSo6rzskCj10CmhOgOUBJJ8ezOHByDSfu2IgmQ9yGjUBVEd
	r12l1A==
X-Received: by 2002:a05:6214:2467:b0:91c:7f1f:2c9e with SMTP id 6a1803df08f44-91f24209db6mr171122396d6.55.1794844783992;
        Mon, 16 Nov 2026 07:59:43 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d93f10sm87735096d6.30.2026.11.16.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:59:43 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSz7O-00000009eOI-3Mx3;
	Mon, 16 Nov 2026 11:59:42 -0400
Date: Mon, 16 Nov 2026 11:59:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Subject: Re: [PATCH 17/17] PCI: Replace untrusted state with device trust
Message-ID: <20261116155942.GA2299285@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <yq5amrr8yldi.fsf@kernel.org>
 <20261116132046.GI2532299@ziepe.ca>
 <yq5aa4n8ydsk.fsf@kernel.org>
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
In-Reply-To: <yq5aa4n8ydsk.fsf@kernel.org>

On Mon, Nov 16, 2026 at 09:22:11PM +0530, Aneesh Kumar K.V wrote:
> > Once you turn on TDISP you effectively activate DMA, just like turning
> > on the IOMMU.
> 
> We considered two options for doing this:
> 
> 1. Via the ->accept() callback in pci_tsm_ops.
> 2. Via pci_dma_configure(), based on a combination of device trust and device acceptance.
> 
> If I understand correctly, you are suggesting that we stick with the
> former?

It should still be done in #2, just with nothing to do with device
trust.

You can't run a TDISP run device at all if DMA_ENABLE is not done,
there is no half step here so it has nothing to do with device trust.

Jason
