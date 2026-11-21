Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267069;
	b=SohJFZ+kVVtQ4Oje4/ZVWxsoXlspFIIWIwkuLq4HuQsEACdHjw6ATB37rZ5gG+BEcgcw
	 EPc7/YNsj+ndYLSQ6CixbVHLAcin0aFH4KpjDvkFBBUVa9+CJyatsjOr/+8vC2NNl8HXa
	 RqP1yYD2uEmeWn+v9n0HexFclXK0YN6+PlRHuTKm3J02TfwOWoSmAQKwv7SZCgcJfTQ78
	 6JPwahdQhhnHh7/+tLXIe0DTIOZpw0Em/ZYfO1wy7q8fpocXJPwqUijRslXKoc5l+6gPB
	 UHCpZvRABXuoe916++5P+aF/jDsC/snDeXKPZ5gjSgJ+uNnc1kuCYLZAPaotrgK9YRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
	b=VLIxNZ22Clc33oX7cdZFy8R0iHU9bRO6YOPHaYLD7bI6pU3HoVI0Z090E6Zd+i1SnRXC
	 NPn8ZsYik3l8oaJUPmy/y80gPQTK0RKgDNyuMXGGqDN/4viUitkPr0nW5rvC9hmSM3Pmb
	 wSZ7Yg1oFdyF5eKxu6nELiVisTbCWwKcCQXSMVNnRGzbt/OVAwDmJmbulbM9Zs/K978YX
	 y3sRKJShpDHeqVWyiktd1g8lWY8tqYhhsTl0a2bilxynQ6JAgPF/GzYymVoTfU+V5BLqm
	 ZUcZQIV6Mbm6dpmuSq9yeQrAiUmeF0MIDLemZ/K3BUx0acLprXg5esIWjusTpkSpL/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z5292Tds;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB36C606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB36C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z5292Tds
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53644ab1f7bso16873631cf.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 05:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795267068; x=1795871868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
        b=Z5292TdssQirJ7anrgy/Ycj0wO1diReVT+xjqWqnvVpWW2hxPlSx6CnnlxSpqetc1z
         +fddjESnGkA74Im6cQr17DvOW+VGIqruhO1KE5CwbJvPS54ALuMYtx4ha2VuyybUPXaT
         reAh9DT5rV9fy+W//lI4WB/2FhxslsHRt8LxjfYv7VRLIEVwboWlnhQtGGPVYMmD6ihL
         rqPFQZBMUV+gKP3QNnxGnSycOaF5ZFKfpghOCMHkZuVfrGH7y+3NT0bJUqPxS/JDH9QM
         4l+csvlxSOav/F6ZIn19ywP7A8Me7D4xiu4/Fmr/Wb6uhFimbUOp/Inli4T67eYP/2Tt
         /qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267068; x=1795871868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
        b=sDeuHQ8oWG+6pQE6fa6+fO3Rzzj8dQFwg5X70N5yEEWuBh8uE7iAa91AFuVxillPr8
         yTFlnH3Ho8jfWKG46Ktm6+yqMfKxAsLIMdjCDeRZynUaUVGhEzr5py26sb328h12DlST
         HDVWjhBOBHIx6MtjTfH2H/U5gQ6ny0BNnWMIdv6CRhSWlSbyQRrSgZLzr5JtW9Qp35Ze
         QeBU0ePpkqOeAklITFMumAVmdleYRU0JGd9Gu/HBw7RN21LmacdXCGn0BkSZX2W0pPhl
         FuOw+DGos819tPVua4kn0pKzUMYCoFu3XQBqw6RrIkMLe0KTCpJOhEUuj9w6uGU2r34/
         wkzA==
X-Forwarded-Encrypted: i=1; AL+hErHnIskYQc338AiLKzT7Rexaxxz7i30vBziKtGMtzJLWEqj8yYK1ZsjG9QDwipw2E3bW93dp/CQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZhdHob3TysxWFmhT3fgC70NTZVMD3UkoRG3H5hQaul1ueujmq
	kswOJVk5jRQ8Qf53jACnEajsi9vt5zVR0EcbpXnGqMHF5RvHe0oN8hzsT6mT9xAblNk=
X-Gm-Gg: AZFdTZcyN7MfLVt24J99O1BpDwmCc+8b6O7LDVHYGAq3qFpX5UyWG6XFAUftGmTDeq7
	UTN8g7sS1jei6i5UmGsS0+kjRCJ1laFuVFknSpS3D7IjVrFhqqf1FlHPt6Kts+ncLI+BBtZI+7F
	7rFxt6IXdoWv6zimqnOHiLq2D5z8nLas9JFhuR4BK2Do2yS4CTPUdd2J2o55r4qxv2kl0ZgiLDM
	tkWRaCru4cVSqEJ7Cih4f3UNgIPAm2MHtr9QL7K5GSrAEf5GT/S6tMyg5nuVaBcViRK32fZht/q
	o0RMJEkH1uJqLcfzTVqTw6PuwxSGHb/1+hA6tSj4FwkCGTxSWPCeiKO9ksPtcKp7G7J05vvvoxh
	M+Z9n+bYGvUz6Wk6WVYrxEEto3daPrhioG5ldRkix55GzxL5fT/pPObaicPN/Xx/wtfVoaobnw1
	TX1KACggEtufeAbVNeLMQ1FrDvLhRwEynlN3VJ6etPaK7kKFTMZqk+eef7InqgZaaG59IZPmSEs
	TSmW2iMi2RNB+2CQEajCJWd8b48KiLZwnvUJunoLj1VJ4nK4yc3gskbWU0ObNALmuSdxboBMtOB
	IpvyFbBM3XjrXn+DLxMeoRJG1/T/n+i0kEmNQP8TASZgxNHsphw/TcxCyR4cow8QQOJ8OFhOlYe
	CTvbyQfDO9GtDT5/gp8erbWwO3ju2NQ3JtwLF6MHIjK0wkeVhXiZvnoJCG3DZ5EIRgzGtRA==
X-Received: by 2002:ac8:5f85:0:b0:55d:2dd1:48ba with SMTP id d75a77b69052e-55d76aa2f7cmr111131171cf.60.1795267067663;
        Sat, 21 Nov 2026 05:17:47 -0800 (PST)
Received: from localhost ([204.244.107.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm53873266d6.12.2026.11.21.05.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:17:47 -0800 (PST)
Date: Sat, 21 Nov 2026 08:17:46 -0500
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: renesas: r9a06g032: Add reset controller
Message-ID: <awGZ-nCCbCNEuyr7@maple.netwinder.org>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
 <awATU_lyjPBxThwq@shikoro>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <awATU_lyjPBxThwq@shikoro>

On Fri, Nov 20, 2026 at 10:30:59AM +0100, Wolfram Sang wrote:
>> +static int r9a06g032_reset(struct reset_controller_dev *rcdev,
>> +			  unsigned long id)
>> +{
>> +	r9a06g032_reset_set(rcdev, "reset", true, id);
>> +	udelay(5);
>
>For future reference, please add a comment pointing to chapter in the
>docs where it is saying 5us is needed.

The reset duration could vary for each reset ID, since they refer to 
different hardware. There's probably no "optimum" value here.

Ralph
