Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795734800;
	b=yuYKY21AGat731ZOo0ixVlRdtIL+1JpEEGavuhLrL8OOxWBnSxE1CUgMYALZP5jfjwD8
	 +WUCpb9RH/KpmxG3rAWOozLtDyakPtIOk+Ij5irez2aYrmwrVP9z9f0688JbdJSo+x4Hn
	 ZN9KPBaN7ePSYzayZGRapfk9MlN2LhFaMhcLns/FnJwV8XnhGImIEVQ9bA+O9jIf1x2Fg
	 S/FRjafZsAx0xeE6H0R7EXovJiLAXJthJXX1RexxLN5S/goV9EyRIXuoK6IUiY4euvofE
	 HjtgPcxDkQJuwkDHnpMMy6xJzA97eh5iUvjgAd3JOBcy/8T8pEzkMGC8hl20jvhboWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795734800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z9oKeq83DopfcyY48tMpJBUolAgSCl+fklUHPsTQ/7E=;
	b=AKIIEbLd8+LomvnhDyCEFQZeUcmEGVdLnWvtr+zLFbq2iVSdboGlZsA1bB9uqQuT22xe
	 URMBMr2gS+PNMwTiNJeDh7QfQTJxXRZx/4LlcKQ3nRCexJhi9PefiyRkZg4veSJH/0dDu
	 b5cYy3weqZ+atIehsL2f7k/p3AKjZ8+NzUdjWXys6m0EjLCdzYJ6WVjHg89pSCgr7ie2n
	 8TGrhIHUXvu73M7735Z4CahtL+pATdqoH95JZ8o/t2PXs172/IlEA+EL/+AAMxIi0XxKU
	 uZmx6AOQdqMD+RYNFiHilwtOpKlvbkz3KcHspgn6820Od4RWFxUpIzBEEJ0fkMxggGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JHBO9wX7;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF77606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 23:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DF77606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JHBO9wX7
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8425059c88.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795734798; x=1796339598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9oKeq83DopfcyY48tMpJBUolAgSCl+fklUHPsTQ/7E=;
        b=JHBO9wX7gqdhkoJohsMxVoW3x1/jmMyJ7SRSIwy8x3gYUyzzacKd1HqKrXV6b1L5H5
         HT72VlK2dkW9IzOl3rb8ty/4I/f6GEYtwE/yfbr7K4JiXc91gXDGLjBOHNi68i20bn49
         hAVo90M4h/hCilcDiQZDA3M7AV+cwzKh8npk9vXEZqXbCGwA/blen0OKL6LL0UoM2fDW
         yxG1j0hZYEncJfVicFWOetM1tC7N/HtwA/RAJN310kmTsfWWqOGWrqrgRD1PO9Xl6Zys
         sw/R6eJbY489l+QAJ7MEdzBgL6eTxYHjQqmRGSS1/N7qeQW7+dfUpmPjUmtKprdwoOYc
         pDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795734798; x=1796339598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9oKeq83DopfcyY48tMpJBUolAgSCl+fklUHPsTQ/7E=;
        b=NkxbPvmn3oBndrhG7mSa96yQ/OlBIBnSthHaNBfq4ftsz56khQL07/IEnAcm/ge1/2
         N9gQmERrqD1KNQsIUJeg+8N98+XWQjW2clOYDLFX1CxnfQrLtEyomUHnzMa/LYeaBGUz
         52qXvO6DwfTjht3QBkFse9ppvN5w2takV3DjC82iUkgNBfOhwrUXsE/ho0D7/vAypWJC
         qABe2d2CBVJqFIkJwYg7VjEucvDUx4GChgTsnHkjEWN3WgaKJUrm1MjUXf/Uwe2RMMgA
         7YL2h5FSmT2zu06/8xYmCJMLf5eNkAHDvZ+0obTQ2M+A8NYsajezKIpmcqOHOVCY7eR3
         Ouyg==
X-Forwarded-Encrypted: i=1; AL+hErHTAiSdFFXyH8pzmXdWbP/VxaYIy+IVRur4q+dXdL6KCdPCdmAcA3bhRV5+LpzfYWr867bSFqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JMU8PjoX2N1wbvckbYj7NDx03FzTK7cKKz6Z0phq3ctlRgZzG
	SD2XIxA1lLkY1VXnRAbAd1uGlphJ6QUWZzhqgZOqfzy4a/mAgq9WolfBWefI26rqVeM=
X-Gm-Gg: AZFdTZd5XUYjqUtrhxiXS86LAKqiaPTGR9nblf7Vl7szVXPKOBN0t8nS78xHXueiDua
	NY0BNa+Aj3j9GN38AejGdPcyOXDeSww0TtaRZDkP15YVrmnMD6fDDH33AIhM2mTKCi+2Il+QcPa
	mlxDZ9MjV1dUe7HCRoOe6rh4RKPx1cFW2y4zumoe9eBWR2gRKq85dS4AeH0FXGxdRc3OLH1uvAV
	WOLP4lsi3IRo8T9VMccZK+P+F7PlnZRi+2EWnSm4j5c5/mP3uY6erdq1aGCHTR5V+LJVjy9wBXT
	UJ4ud65QH4s8OoiynofBz+bXSjqkJO8vPVQzyGG8zHDxVG7NxGvkHRrKhvZQE9F4x4SGKoAEeoI
	qSnxIIb6Csb1+hJ2UW01FVw/843SVMSEg6HssnzHWMsg1Of5I8tXKvNJjdHpkTfcBpTd1zLIlXn
	BAljbMn/ZEO/C2zkoWeTSyvIJLYScJGn1eNQ+CVcMFsH95XVOXQYCnA+aJBLmoecXIh9wnPkRDz
	XSFpiFvQrKqb7emLao0vQwGZo9DJdsbhFlK9w+REGArC6Rn7syPSHv2OxjiUPGdP2mRaE9Olknj
	Yf/chpPms5UjBPKSzjddJTQZfxH3xeplDVs0lqN9DgTbjmOjctQt6QGQV0ZmirR1CeOCwxCDxQM
	C3wizDXb1x8OgFcA3FftgrPRaMw==
X-Received: by 2002:a05:7023:b88:b0:1ac:d029:70cb with SMTP id a92af1059eb24-1b5568c5127mr27239842c88.30.1795734797799;
        Thu, 26 Nov 2026 15:13:17 -0800 (PST)
Received: from [10.1.3.103] (162-231-245-176.lightspeed.sntcca.sbcglobal.net. [162.231.245.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm52330279c88.8.2026.11.26.15.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 15:13:17 -0800 (PST)
Message-ID: <eaefe02d-02ea-4865-b000-7d5b74da9f27@wkennington.com>
Date: Thu, 26 Nov 2026 15:13:16 -0800
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
To: Paolo Abeni <pabeni@redhat.com>, Oliver Neukum <oliver@neukum.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?Q?Jan_Kl=C3=B6tzke?= <Jan.Kloetzke@preh.de>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118034122.315979-1-william@wkennington.com>
 <7a0566c6-7a5a-460c-a113-d9463be3607f@redhat.com>
Content-Language: en-US
From: William A Kennington III <william@wkennington.com>
In-Reply-To: <7a0566c6-7a5a-460c-a113-d9463be3607f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 2:51 AM, Paolo Abeni wrote:

> On 11/18/26 04:41, William A. Kennington III wrote:
>> cdc_ncm_txpath_bh() calls usbnet_start_xmit() directly without checking
>> whether usbnet has stopped the netdev TX queue. Since commit
>> ad70411a978d ("usbnet: fix kernel crash after disconnect"),
>> usbnet_start_xmit() frees any NTB submitted while the queue is stopped
>> and increments tx_dropped.
>>
>> This triggers routinely under bulk load. With the default 16 KiB NTBs,
>> usbnet only allows MAX_QUEUE_MEMORY / tx_max = 5 TX URBs in flight, so a
>> bulk TCP stream stops the queue constantly.
>
> The sashiko comments look relevant. Also it feels like this is papering
> over the real issue: bulk transfers should not cause TX queue stop.
Yes, this was my original thought too. I have a v2 that just pokes the 
TX queue after doing other operations but that feels like it just papers 
over the underlying problem.
>
> It's not clear to me if there are H/W constrains behind the
> MAX_QUEUE_MEMORY value. Perhaps is time to revisit it?
I don't think it's the MAX_QUEUE_MEMORY value. I think it was a decision 
years ago about how the queue is stopped around link down that is 
leaking into the congestion flow. I'm going to port my platform onto 
master and do some testing.

FWIW neon seems to think the BQL changes for usbnet might have fixed 
this as a side-effect. Let me test it and see. I'm not sure how that 
will help me on 5.15 in the interim though. I may just carry a 
downstream patch to force kicking the queues.
>
> /P
