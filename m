Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840359;
	b=cECIROX9qhI7vFjsyzZFMsvPERloBWSL5zy7hZQysubl0eppkwvf0Zcl0cJiUy0tfwkB
	 dO1/T+woa1z+uhaEPK8s0fwRonN+khDNW9OS4cnwRoz5k73aK86Mp23vgdyRau0bCs2wl
	 iteoOeAus/Wvd4Aw/XRLmrXTCJ43CdjdrefGeOL2utk+DezCj4YInM++wpDiiVLx2QIDa
	 G2JFFxzul5A1spWV+jMsJFOBonGbInS0CAFRRyDEVfAy78sF17n0EpKjXbwHBMDt7d5CU
	 aY70S0WfKtX6Yn1yaboZWlpfikwVfbR0bCgDqx9HIgu4900W1WuDOTP06a2iLar14Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
	b=ugJHE7wdF4IrReTxqaLl05hqHO+6qUiIb7UcQmhLzsNXsCn+WuM2eDvO7Y+WNm6N2eMD
	 OCdrNPaQpkTbz4DyMKJ5rhxkwzrIKADl6Z4IYqt//evAxSBuzlr/sInq0UBgvEyVI0jtv
	 f5xe3Fzzvnw9NZAdB1VN0tew6LGvrH+DRE4FvaKzl2vVbYJWAwlE0C3kbt0LqT+pWCcLJ
	 Q938UGrqQKU5KKh4TXoTswmQbDRwwSpMnODr8OGe0mf62xscWTYpMfruRoCicgz4x1f+W
	 NMGtlyoke/JT9Mi8gS5pdLrVefx4xVkap44EVHUsTtm7iB10nwexk50VGYlPqcSbC9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dLdJyonb;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF63606A33B
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF63606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dLdJyonb
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-949589c1495so290257585a.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794840358; x=1795445158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
        b=dLdJyonbx/GT9GciisxRrbnKJNPmXRO37SMr0DcL0fOWPt4npP7q6oSEFPRBxyhYBG
         VwQv88je59xwJGF1tzvO02VHIK2UoI2gFnHM+RoqxVUasg9DyQA32ToeKqV0tOS8H2/F
         utZ+RQHXMciPdHoqR96pmDBV9oFbAflIPtcSFhX2+r9dDE0rLhaGZCPsZ1j517doL9zB
         RpfAbapy98a71EK1akS809jjM1beUX7TmDUaCrtYNcz/JJbJ2sGjj2UfCKl0NoQ68uWW
         NnufbW7FWZvXAJBZh4GXQ7J60xB7eIn/T76+zn9Pq4vvTPBJTSoxoiKRgL0R3QgrjVbx
         3mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840358; x=1795445158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
        b=BZ3drydGAcsV2ZKGwOUUZbiDDskN/jSH3doWN7yrTjFWLVz+GhQKs8Hpl7klj0nJrM
         owI9zzQC2lhU/Im6z40Ddai7O7CibfazczkPRNmuFQlUe/2L8HhptvDaNxjBivOqvKST
         Jrc3gzEDQ5506TcCD661ERY9qTXLHokWJ7bOe6cbm7MQI9fzENrd3M87H2q5P0TN8dH5
         3WUODDqJkhrWLDwy7McI1vB/7lGyTFeTCbnJx3bpr9TNa//g7cOl0zn5eVWtqLxt1RT9
         xs9op7WE1K6PpeOW6WOZXuCi8Hf02AxMyptbt7ZMUu56YIULWEmcn1yMTXKsn61p87Xl
         Zn5g==
X-Forwarded-Encrypted: i=1; AL+hErHdWon0Lii+SBoo2vWAPe60K33M6q4OwQRAtF/lD2rt+w3tq8p0CsWShmjI6yLcOsfdsMPpXbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pilPOhFjk/ul5ZrROPhvndHvWcHQjyZHxfVkk2T/oM/BlVL8l
	vA8DYMNoUKg8372KK3GkGm2tn/OwMfW8x2V7nIWvQYX3HF/xbFHfX465RyAbbR0aLwM=
X-Gm-Gg: AYBFou2N+/2gxaSTxYtearbP+9mXcfdNN1nglS1yimBRaBVSvZXr7l+QoeI1aJLj7Sy
	lZ3c8XrMVB15hA6Et9T4tI4GNo9MOi0T2shd/FjBpDsBkPqaspZcQrr9cBx2tGCL3Gsfh2TA0Dk
	9jCx3zBnQgcRFPslBhC5loIvTRpwdgBW1HvJQH1/F5l1je7CyttycijyCG+rqPMW3YBt6F3MBzl
	u94ifGDZhm5Pm++X2pysjBvOnM9gmhZPSf5T5vKfwddF1G6G7DsPpi70Rlf+3WQaEoz+lO/RRTZ
	KVlbVeBvsIWUr0HdVEkiKFOQS08P96X9BbDzjCJVqdB1S5u3OstNGRsOjmY2m3aAGCQj/7bxDGG
	YixlL+WczMnZJmqjyqNogHDEMei3vhFPASL9/TPxbqHvr9pLowcSsCmlikd6/0zZ/ju4VKLhY/W
	umLqmnYWPEkNN3rFGXmHz4ETIMkFZK6sbmFW08HOWyW9qXmw1dGgxYXntbDy8PPsbXdmqbXO0iD
	rY7Opln909syPkZB7lCOhxlR6HEjE+Saj0qvZH3Ml72Zn9r83CADzw0zAgn0/uzpab4Dmx0udKz
	14S1VQ==
X-Received: by 2002:a05:620a:a41a:20b0:949:5872:be1b with SMTP id af79cd13be357-9495872d3c0mr1015844485a.39.1794840357475;
        Mon, 16 Nov 2026 06:45:57 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836079sm858473985a.18.2026.11.16.06.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:45:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSxxz-00000009V73-1sJy;
	Mon, 16 Nov 2026 10:45:55 -0400
Date: Mon, 16 Nov 2026 10:45:55 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
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
Message-ID: <20261116144555.GM2532299@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <yq5amrr8yldi.fsf@kernel.org>
 <20261116132046.GI2532299@ziepe.ca>
 <20261116144103.GU11319@unreal>
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
In-Reply-To: <20261116144103.GU11319@unreal>

On Mon, Nov 16, 2026 at 04:41:03PM +0200, Leon Romanovsky wrote:
> > I think it should only be for the duration of a bound driver?
> 
> For now, I decided to disallow state changes because the IOMMU may outlive the
> bound device. Unbinding does not fully reset the device, so we must quiesce it
> to ensure complete security.

When we refine the lifecycle for the iommu this issue should go away
too

Jason
