Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516788;
	b=KgFUNSg/Wy+cevtEPLoqBV89VFudzRbmNozgCxXdm5LENVEOL7YWq9WPqt9SJ+NwlAUw
	 QT7+QkyRgZcS0Ffob6bdGqmKQURcrYp3rVs3kC3hJsefKT/odi2HAtelVIupoBDeu0pGe
	 kqyuh10mpGQ3fzUG0bPulW1X0o8/HBktR0JN+CcjMHKTNlhVAnxEbQ3ILkBeFE0yT6LtZ
	 rh1n/Dwde2VI/cqwSFmRw3042zoGzMFllB03lax4CR2xOhntDaM7R4DydLk7aNhibTB1b
	 PDuGVuFpy2rXSKQKN65/KImEbt56a7MYwzQjVwaaHtk7mIUVUCJuqkiOIyQeD18BZeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
	b=r1YuPvzl+s4x6HGafFdCpR8SMpbdJOsAy0mexrRC8loGgHylOPWovltpCIqC1+lQ9Pxd
	 OIlQkS4ipOjxywQHW48LfLtOcbwc86QcMRRQ6XuSLg2nOLkk59LBCEEbF2YqcOvY1wZps
	 iNo+t/xIsSMQpM2emweCTPEf8uUY9QcpASG8ZVsBb2SHLPfLx5mGsYBOUkAcBiNNFGbKE
	 N2nr+UhIowm8vBtt5bjGqy7pqW8qKoaKtVaPYltDSAQrVQ4aR3J7oqz1JhhdwzcZNFkMV
	 QyHvh6Hn9/bADwF/vVzUJsKJ2P8nWLDhpboRjAs9DXQqgS9EjDSZcoRg0M/hFCdzQ5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KjiX7YWe;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F476606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F476606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KjiX7YWe
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso42029575e9.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795516786; x=1796121586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=KjiX7YWeSkA9Dw0WA5xjWaOqnyEHCedD00sUzMhE3sKEAvQ2TPIHmIyS+enWPn9hqU
         UHnNtz+vsI9HdnLLJLRNEHpW3n0qDPjDGGb+MMmUEkY4+DtknEToZAEEAwd6ErlDRM4U
         sl6ks9V8P+KgBQBXge6XtIwqjU1IX32GeqDZpfsQ5053CJLA98ICyRMFUcjrF7GwSx6y
         mLBhDMnek6X1+TiwUBOkVQB80sS1Z2oue9zDTiR4H+wlMmpVb+6EJ+EZoBBfGsOtxa1G
         85CHt1w3B0RFKCYDolOV20zywTKINPHyMkeAAvRZwyufXjasNY7vVq1oJTMaEgpAJPJ9
         588Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516786; x=1796121586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=kPCEArEFujV3LQ2QBbwS6n5iiTPeV6YX6YbtqxYBEf7/fbgpU6kB3ZcK1lbUBMMMJm
         zH4+KmGNJfwIKnt20bmgFVTpqBgdCCTxVWLhnvjOoh6pp9u8fsAoh1vIEjHU6oemBhzE
         yWicryfs4uyawo1cuGRnZyQB08d6NMnVyOze4xcCfMjcf/+gT4wGjRjhnS4AsbbB3oW3
         0kGhbNvF3KuVsqkrzl1SOUB+Cde96WcHcw4LS5htQLmIwUASc+ZSM12HNDiYMf+a9oWI
         6ggg++ZrP14LfwfY3vGEYs3KDB4xsCCUQDeOUzlwvwQwUESrDK/IzhAhb+/GOzQpkf9d
         GGJg==
X-Forwarded-Encrypted: i=1; AL+hErGdfH9fBbu29rdidaAnWcaZTtE+F5UaUOosu9Q2g5zRnAa8RbkY97D1HwreeFynlq8Llx4r+XM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Jl3HP2jO1Juf6+Kb/0XSMgk+ageLAvzxEoSL9vW8Ib4d2ZhOx
	qd/Mm4h7u5eZBUifboRWXrIZoqoWOUWB2bWSef3qG8Fje8F01HA4DK+ymD4kb3YIJiA=
X-Gm-Gg: AZFdTZcM8u93OqXXjQiZdlEwAV+klRYJU1ZS8OxVHRB+d99t1u8uNiuB6qXSvkZ9mMG
	QlWutAvCdd/JiIdEskOKQu56ICJ/vIYZpsqJe6Q7qS49w3Ieoq9MBMpFhXmA2or/NcB7lHPuhJk
	QmHG9fikEC717YTfifrvi2GcQ26Izd6XUZSTkFk0+CNO9406aVbcqOC7LeRdMAsbVqSeCebmuNZ
	0y8+JlmM/JFQyokv4SxLGq/L94vI1fQRcyU2iFhICYh5+smo25v835VTkliMtZG4/MypRHaqUoa
	cVixQYqO9d+XVXS6M44SKBxupM9PNYlMj+TnLlpdpVLjjVbIAqnAgy+RXauvPR2dPxG2EY/wrbH
	kApZsnZfRtNKf4OHE3EMlRNvDdM/byBufp8w3XgZ6wyHnakDMiFzREWxLMhwyii9zouCMxtsW9S
	Ri9zIwfg9nCgAmratzjbfwuyQ/QoSKpwgCwRPMezvsuxGjzkqPC7VLeAbGzu1NEGRbYvZX8EH58
	yT6mI8PsAQV0es73Zr/pvzrpkg2PM6jL2fPpB8DhAu5SIk27H+Fzb0VPNpMbqL9DtX7+vIJgvB0
	vkIjiNX/SzjE/LZ50mTSCaj/MTvQNJoiB5T7LzRFgmcsONEc4OGLfVBBhnqhK0b6gsI1
X-Received: by 2002:a05:600c:64c8:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb8881d141mr281064655e9.26.1795516786433;
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Received: from ?IPV6:2001:a61:132b:a401:6cb8:7c28:11e1:499? ([2001:a61:132b:a401:6cb8:7c28:11e1:499])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm425218335e9.5.2026.11.24.02.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Message-ID: <65749362-927a-492d-8bff-573c277fe456@suse.com>
Date: Tue, 24 Nov 2026 11:39:40 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/33] Bluetooth: btusb: Fix MediaTek ISO claim locking
To: Leon Romanovsky <leon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Chris Lu <chris.lu@mediatek.com>, Mans Rullgard <mans@mansr.com>,
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Cornelia Huck <cornelia.huck@de.ibm.com>, Andrew Morton <akpm@osdl.org>,
 Jeff Garzik <jeff@garzik.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Bart Van Assche <bvanassche@acm.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Dan Williams <djbw@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, iommu@lists.linux.dev,
 linux-coco@lists.linux.dev, Alexey Kardashevskiy <aik@amd.com>,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-sound@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20261124-device-trust-core-v4-0-037eb0d17b1f@nvidia.com>
 <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24.11.26 10:43, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> MediaTek ISO claims are performed from HCI setup work outside USB probe.
> Locking only the interface does not protect the claim against teardown
> of the parent device. Unconditionally waiting for the parent lock can
> deadlock with disconnect while it drains the setup work.
Hi,

your patch raises a question. Can usb_claim_interface() ever be
used safely outside probe() without this kind of locking?
If the answer to that is negative, should the locking be integrated into
usbcore?

	Regards
		Oliver
