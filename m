Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690288;
	b=L1vwMRJI8mou7db8yW2DjHq9FCVPZckTEZpelBzAiCDq1IUiOJRvuWruLc/we8TPk0Yr
	 9CDVdAlXqNZhBq1+95YdccBfVGLDDwxfbrMOZ7qVL6nbldWPFW6uBOuDO6CQR4nvQ/SS8
	 Ychsd95TffeZypEZFppxR17DtOXpvZFmeMedrBJG5oTRBsJs4s4J0GOOr678tm96hftft
	 wkth3Dr3h+UuPH0k/1ilWo9HhR+UAmRPRFv3P+XjZdzSBPdv3f1/7hbJr8iXercNfehTL
	 +qxYNOftPHL7GDs1+/T7sBuRAImoC3qUqbOPSEhzQ58a9PsrIdDbEqex+wJpn/y6gaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690288;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9JEgpWnCz+rbZhXDu8naybzde7e8JEfi0pth9wFeLfg=;
	b=XDA050Dn3aVl5cqq1imvddOO9hId5oeHNOGzIK8hGSTN+Rq8BaMTW3RQ4FkeIHxIr104
	 txxz2rRLz5irBfppL4m+5Bj/A9eBvw2aLi5cLC/z0rK6koFm950ixfPNDhy8aqNn77VOU
	 cuK4QpxmWo5rpYZBKa97+AW/inxVq5HkKjn/Hae2fYga4+QSNU8z9u+tIVK8I7BgEDZhS
	 HPukT4roGNpY6AWD8QVmBVsmxtt/dGB+g9KlbUsc1QRu6D+kRvBCDqsfOKrpb6xVT4S/1
	 wyOfBpwTMl+4exl9Qecv1z3AKTyS4YymoHGsIiGLoWOPuKovxj2IqDj5BcrQyODHLyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVhCp4gY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LIJodMzh;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1E3606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1E3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVhCp4gY;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LIJodMzh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795690287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9JEgpWnCz+rbZhXDu8naybzde7e8JEfi0pth9wFeLfg=;
	b=IVhCp4gYsLWQlCf0GRKOYBJF5IY8FcyTE2sZBU4GP7pKfLrlpEf+6gyN6Dt47VWdFRrEYt
	nHz7eLkIRoWjycvbalTuk5g66+Cfg8M2doKmmT+dWxQgLANP6mNgWXsfjJsHLeoC5eoa3r
	z3KuFqozIENfXxqInC+ZJVoxcF2ZSWA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-9JH-cI7VNgOPBfzPY4fABw-1; Thu, 26 Nov 2026 10:51:25 +0000
X-MC-Unique: 9JH-cI7VNgOPBfzPY4fABw-1
X-Mimecast-MFC-AGG-ID: 9JH-cI7VNgOPBfzPY4fABw_1795690284
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4ab855a8c21so5437161f8f.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795690284; x=1796295084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JEgpWnCz+rbZhXDu8naybzde7e8JEfi0pth9wFeLfg=;
        b=LIJodMzhs4AhX+/lBnW+CSbMtYdS0Lk6JiuaDFm2NFKLmd+DHq8fF2VPlljWOoyVpP
         XfyerrXlcUrlY3NywfQ4Su+Uc6cyrDrAcucQkw7BK6qmYiyKPOR5P4mUq4jESbl09bhu
         4IGqSEO11btOE/Kmq+bM+ukgs4s4Kd365rSlKJLcFnuHz142vCOA1U85OTg7wn7R/cVw
         JIfkEHq07Y+0KBHAtxox4wEgxs8g37RhoN4yKMJGoqRfhLZ6KaqHQlXp6kojv5RG/GuT
         LaNrdG7hrMChJG1YetYo4996CLbFmVW3/a7F0xVmnfXoZeGwrqQGRV2IehCz8vrIff6S
         CCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690284; x=1796295084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9JEgpWnCz+rbZhXDu8naybzde7e8JEfi0pth9wFeLfg=;
        b=UzMX1yaFX3zqexEY0M50hP/3O1QoNr3b74uTGqRXQRea/3QxWyrYzZYs5W6QrVAfNK
         GUWqFzlO12KgEq/W4ulxhxoRHIS95OnMvMPMq+xDicMw4pcI/JwCfq4HoV0bDfzdifHZ
         yi12Bb5ym49nZ6OeqUGTd70UQsdL1Bvp4tpmMHMBFkSfDfwRxz44sQvhjoWcbu4cP/1X
         TG/CeFW6PU6qlZH8TUd2x27BJHiQS2EabfZ8zyghRj4EFn1ADXYKGzB3oq9KrTS94vMA
         GKCJjGvqUTZL+TcBgIr5zN+lD19pjGMAK6Jd2HEru3q4DEpn97hj9mInNJkalZRh+laN
         imWA==
X-Forwarded-Encrypted: i=1; AL+hErEnBDmDkweLLXQ0qsrB2xHkluCi/a6cNXZT4BHDK5oNyNtYiFl+R48XfhqIkdBu7K7yqTlWqHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U8LSYyfFJ996dktsRiOrS82hnjfbe0t+cpKG4zh59iDkgomgS
	mUlin94QA9U09pYqjVAfRplggJzOA7zvn3JuYHTOa8fSSe6s5ng6CtFastB3/3FoD2jwtHlDVBP
	kJYQ7vI5ELfBhiNOx4rpUGWZn/SIhZXUJ30PQ0ZF96B0lbURPtDGzUTP5Eg==
X-Gm-Gg: AZFdTZeyFGdA5aOZEoowW/NQPS40yYV3RDfjcbOErL/clbyFmfzY9XQ5saZAC4AIFRP
	nVIsUO0XFS2kd51lOcGqrHE/9Jhx0v0to7fO98IBupUxf5tW3Nz11tMUNqHJ7Pmm2G0s4UJCzvZ
	QDh6z4xhalaTMXDN+KJ+F0dvY12XMDNtn8bKq9L62U1ZLCsqopzYxHxQQkNWQ8o5GzzL61WsHmu
	IZ8i8TS1JuSdUU845tl5Ag4Q/K4nxiJBPO5lB/p+yCqpFsKN3TUMUfpM0sk0uuQTRbmIUdkWdlV
	lbibp/5vVwsJHyZ1rLX0tMJXFoLZLuAJm2X5rNbGRTGeiMPwbfOl69xlgNvjKap27PEXHmZQiAY
	gQ8ibmUEyErcsJSRKOkP5FSfi/tBLgX33xi0gEKeQElTutiR55lfr91PU8RVBZvglvJGAnDc8xQ
	eaWzp/9V8a/64i01JLn37UbcVGsGK2wL/bfpGLRTgtdj2E
X-Received: by 2002:a05:6000:4013:b0:4a7:d4c9:ea03 with SMTP id ffacd0b85a97d-4abaac57bb5mr38352837f8f.6.1795690284020;
        Thu, 26 Nov 2026 02:51:24 -0800 (PST)
X-Received: by 2002:a05:6000:4013:b0:4a7:d4c9:ea03 with SMTP id ffacd0b85a97d-4abaac57bb5mr38352799f8f.6.1795690283567;
        Thu, 26 Nov 2026 02:51:23 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm42611310f8f.59.2026.11.26.02.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:51:23 -0800 (PST)
Message-ID: <7a0566c6-7a5a-460c-a113-d9463be3607f@redhat.com>
Date: Thu, 26 Nov 2026 11:51:21 +0100
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
Subject: Re: [PATCH net] net: usb: cdc_ncm: don't flush the TX timer into a
 stopped queue
To: "William A. Kennington III" <william@wkennington.com>,
 Oliver Neukum <oliver@neukum.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?Q?Jan_Kl=C3=B6tzke?= <Jan.Kloetzke@preh.de>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118034122.315979-1-william@wkennington.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261118034122.315979-1-william@wkennington.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 04:41, William A. Kennington III wrote:
> cdc_ncm_txpath_bh() calls usbnet_start_xmit() directly without checking
> whether usbnet has stopped the netdev TX queue. Since commit
> ad70411a978d ("usbnet: fix kernel crash after disconnect"),
> usbnet_start_xmit() frees any NTB submitted while the queue is stopped
> and increments tx_dropped.
> 
> This triggers routinely under bulk load. With the default 16 KiB NTBs,
> usbnet only allows MAX_QUEUE_MEMORY / tx_max = 5 TX URBs in flight, so a
> bulk TCP stream stops the queue constantly.

The sashiko comments look relevant. Also it feels like this is papering
over the real issue: bulk transfers should not cause TX queue stop.

It's not clear to me if there are H/W constrains behind the
MAX_QUEUE_MEMORY value. Perhaps is time to revisit it?

/P

