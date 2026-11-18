Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009883;
	b=x6f0f0inFHwP4sZyK3B4Ul32VWsz9VAN8yUnW2g6LQoKWXcqCdGS0cXPRWzdHb0OLGBm
	 p6Jqdh+enl3JqKCnVqUFrCw0OTac/7ymaKHam3/B18aQGyb0E8B4bjjhjc0UanlpAZI+f
	 s1KsJ4wEPygyhemfwN20MAR4hQxZ9jpGp6XL1HpO1HTq1rDY7XOKJd9MkyojdXe9efNF3
	 ZgTE6sLWMwYErChtK/oL2Vm2bey6S6RT9nybQg0qgSswOAnil9vw+FHdmZDE3nfU0xu8t
	 4zPg8PZ0TR1F4KrLT2RoQRhoEiOtcMvY9B1beG+H76d83PztBiXphYm6++29f4V7bcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=MIZ17EJ90TVFSitTF/G0V5tHa5Ryh7rhMmfLDU73SIE=;
	b=DzN2pj7HANQ4xs7LMkm5eXmxnBdtgRcThxwLcGNbO/T5AeLyjyGLFFQuMwtK4eR5yTkK
	 GBXwAs7m0AM7pCbS84Rigyucpvg4tuMI8XNrrVWXy4Zu8ff+8FClZcZ7/v46+4pfnV548
	 98sr3koXUb6P9pEOqPyOkTlb5wILagPYv67c4s+OHGkO253tUfbjQKVCGWIJp83od8vLp
	 qebSiTOyDFuzTuGQWjqZpUC8F6lRxpjAvjfKaWP7hj4nHPF5pp8VOweE1NG1Ui31pXY2O
	 6YkE6Ke53z1d3Wno+9/+9kLo6cPaEAoXeV7RY1sq0zaai4jC+NT5LMyvgLRYY95vjOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9SNehBa;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC816606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC816606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9SNehBa
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so10629115e9.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 05:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009881; x=1795614681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MIZ17EJ90TVFSitTF/G0V5tHa5Ryh7rhMmfLDU73SIE=;
        b=n9SNehBaVqytzIHepeoxjU3EJaqvDEfpn6SeIG7rGNbatJoEMC97JWUV8pzcEjaALD
         3kSbrOzCfv9fwdttVmYfl4HeNGmHZzo2KXkIj+zoNPIIGALPjic89FLTFJxG7n3p4GZU
         s7ROnGZOQGw8NXCKtrVuk+yiW9OvXOiQzoOaRzSzZJ8wIutEocCTx+AQiP44uYF1VSyF
         Pf1rZtVVzXojGj8oZPMlDGeNoKTazvxLEdyW3NapFJAY5rPKI/WxKG5ArNSt+DX7+chm
         2wQwQVwzbJ8o0q9h2U//41PkRqJUTlHf5evgKbPpY5EzN9QDlB9Mpdl18U/MYpJU9K5n
         W93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009881; x=1795614681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIZ17EJ90TVFSitTF/G0V5tHa5Ryh7rhMmfLDU73SIE=;
        b=Fk0WjyagHCsQu9IQSFM0UF16GzZtS7wPmLhsiTGAP613WGalLt8+63DNtzh73viCSv
         Pj7Ltc/T39OAU8o/nEnyu6MKrUznwrQUWhOimRktRsZbQNdqd+mKW9FBtroCkl+zobsh
         qb5vHgxsSbddgMNSnG7UuKMuc2tULx30Z2qhR/19aYG+7mr7KZ7jEFfVMtdoj9gSJdXE
         hXTveZB22274bOzjzu/gzdFLl0LJya2Ywb7AA6DtOADVfVM26SC/BPadA1TWBivzZ/Dh
         pa3bzdJgqCdvNJffDA2Ts+Tha7s4Gw5l4NtBH3G3G6BIh8hnacB07zhCqhEm7xzG5ESR
         14Yg==
X-Gm-Message-State: APuU4Z/E3wC+B3TDLo1gfIV9RA7VZxnzbl8fTiBX2aNfBZ/WZk7sXC8v
	VMBntPILK3Hpw70NVcMN0i+7seSDktyJ2paf2NojLgpytaD+iEIPZXoO
X-Gm-Gg: AYBFou0ZOi+VDvZ9iulbSYJe4OyVeNKyxc7GLZc7ZEvvRWiXaGvdPX0QYjZH01U9Zob
	DBqSKIXgttuepGuQeHsiJgbLF2MEwbmEt8mp3fRbQbcgrCMGnr1Pkcm9Raro9RNcXahpFRsw2cF
	iksN8wgXREhEn3jFpxEnHqhjg7OutSGW9R/lxIM7PP/gNnvPlmrJFj/jqASdNzFaAfK7KorWeEF
	CPDdaQoJ/nRdyAkVZyPMV6CqKOdZCV8oB1bCT3JzMsddvZvy3lL0WNslg76tw9uS+tWhZQnwfHf
	Tc+LKrbc5ODR7Rmy+jY+oK/HfBRM1ufEPxQKsbWER8I7iQh8ns3Yh+aVKE0Meldiw1B0Ty2Lp/S
	oCyZQC5sp1GDRZI+KN8CTHuhcMJyxpEmPARhKd7xRcMWyBPk7iXVXSBmJubNjqqIiRLUolIBRun
	tdn+IcW8xd0z9GFDZ/EgIq1uRxQK+Whm5hHaY40mQqc6mupmspWx4CpxR8AzqFDRJKdqho0zwIS
	f9xvD7Bt5dMLqqzc3wLiIjHnZo0KopTg52PM/ixoewDN98kvWlY7FCJtuXzMNyAKiZrbywLmTNx
	+yPIieK1Hels6JT2524rs88Czl8rNFLRmk2AUM0P1G3ZtowvcU4Rx6dJkfWSma7M//jeBhUY2Nt
	hKi1vrQxDf1s7jjOjKL1Pz36k85++IrOtQDs=
X-Received: by 2002:a05:600c:5008:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb7da2709fmr53221605e9.20.1795009881082;
        Wed, 18 Nov 2026 05:51:21 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm3926250f8f.15.2026.11.18.05.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:51:20 -0800 (PST)
Date: Wed, 18 Nov 2026 15:51:14 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, wellslutw@gmail.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
Message-ID: <r5ro4ebbpapeq6yacjttlc5k2isw6seaazu5ixarm4ackmshtg@a5mampmyaz3b>
References: <20261114222744.535158-1-janislacis06@gmail.com>
 <26c5c08f-d6f5-49b2-9fa8-de6f8c244a78@lunn.ch>
 <7zevuoiao6ildvkxt5baqnalb3nrx736krdxkbrbxouelukveq@2wo6m6cfl6rn>
 <461f7e59-6c1d-4ad5-9eb9-5e5d9b4a9e90@lunn.ch>
 <uscwfcie3wlbyljcowjvwhto7aecdid7cxjknvd4t6t4fyj5tt@lpyoijsxuduk>
 <601a79c9-0447-4571-8590-998d02bf949e@lunn.ch>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <601a79c9-0447-4571-8590-998d02bf949e@lunn.ch>

On 18 Nov 14:19, Andrew Lunn wrote:
>On Wed, Nov 18, 2026 at 12:10:32AM +0200, Janis Edvarts Lacis wrote:
>> On 16 Nov 23:19, Andrew Lunn wrote:
>> > > I am fairly confident the change is correct, as the documentation
>> > > supports it.
>> >
>> > So the LLM review is wrong?
>>
>> No, the review is not wrong. It correctly points out that the budget
>> cannot be exhausted during normal NAPI polling in this driver, which
>> I had missed originally.
>>
>> It correctly identifies that the old code unmasks interrupts even
>> when napi_complete() returns false. My change calls napi_complete_done()
>> before unmasking interrupts and only unmasks them if it returns true,
>> indicating that NAPI polling has completed and interrupts can be re-enabled.
>>
>> Finally, it brings up some pre existing issues that seem to be appropriate
>> for separate patches.
>>
>> If this patch still makes sense as a net-next change, I will update the
>> commit message to explain the ordering and conditional interrupt masking.
>
>I don't think it makes sense since what it is trying to fix can never
>happen.

Understood, thanks for the quick review!

Best regards,
Janis
