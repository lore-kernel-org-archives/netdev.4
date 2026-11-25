Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619789;
	b=nB2UFglYVrkY3OD/61ul0PPsXvbxnMnXhn/xqV52miipXi7CvWXfaanYfV5TqDcRHbjW
	 NXk3LWlXZIulnQOFreYuAxMucXTlQtlo/UrENuRsNkhfg1AWXQTgUtntlbGBnwMZpEOPJ
	 73B8D0Bk7VgwpaKg2TsMWESA9qhogWuObOQ2UQ5EX/cgJk315czYySEA9kDuTqQ58nHvd
	 56TixTAsOcc3tS6Oyh6VS+2Va/qrzhnHCUGO3B9p1/TcmSCdggCq2hJXT9gIGVnh4Fes2
	 7Z9P6DxXrHLXXz4HgFl62I858nHjbixXUktJ/fmL4a2ag2+EmAF+n2ZgZdVwO3LXpww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fZhnpMGuy8q+jXTQK/RAHc/+Uuj/d7tbWlMf2HdxJHU=;
	b=zLwZhGJxTSM4obQjBBnIx+EtK4BFwjOt/fn8FwZwO7ey9hNe4y9Eds1PYaj/L+EsJAgP
	 J5Xx7/uupFdoMf+BLpquCtsBch7O64cGkhwY4uJGeI9u3rSHQ/4uMOW62hSHb04N+52pm
	 ZRy1+g1sB0FHsp4b+g1WA+9lmA8XkZdtNAYGPhU2w1HZTHOC6ZXVgtuqp4h90/0c1xSlN
	 ObP82UT+CnbJgPtnHA3Nq5tQcrQwynz/4AVj7xDKCcjbUDbgmpStazluYzghvZQjPRnUj
	 loj7pOh3yuPmBBTPWI9vSGj3mZP+IIQdzUERuFXJ0HvMBjbhH+/O1NCM/wxN6iazjPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RHwphIVO;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CEA606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CEA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RHwphIVO
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5188e4980fso101028466b.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795619787; x=1796224587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZhnpMGuy8q+jXTQK/RAHc/+Uuj/d7tbWlMf2HdxJHU=;
        b=RHwphIVOhqawxkHBNyWJGoTHoIONjZw5hdSAz7G6eZpZxXYutLRqFVyHNPqp2DVpKp
         Vzql0LSSc14wBe/3iQ8C5qavy0zPHQmEJTHMUlNB6Kq4by58yqRIFqKJAULrdtW2oObw
         UyGWoAUb9M33dFb/sKbWkRyC/hBX7EUKe2f/RQ1QJaPMWd4NbckoW4P263kzgPAX954R
         oc4glW1QnHwsJ7eXrhGm7qzd8FztHw6IcH2MmSXLyqALc/7tw16xDwcSBAE0bO+PwpRe
         pwKg+j0vnSt5Ddi0B2HJrmJD1LoPUKgchSeUrXC1XA3Dd2GTOdiUOdIfjsGM7vVPddoN
         JKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619787; x=1796224587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZhnpMGuy8q+jXTQK/RAHc/+Uuj/d7tbWlMf2HdxJHU=;
        b=ixCA60syzhRmu7Aq1Y0N1bU/qKJ7q4YeWhT08WpiVZZop8fFlicPPDeJLoxpqfIPlf
         kkZaF6hJW1wbN/6ecC6KRhRubSOUbA4KPIp22fjGzbN/VUNQb2fczS5YstxJpgENGkAz
         qd6QvVVRVopslHaeTAlyK6qD/YTEavS1R9wKiMy3C1wWaypSQ9JlaS8kdhzjFPkkRCiy
         3bjrEqjNQ40BWN4JyhjXgSUpGcQibEFXmzNqE/c5XgAa+alTsx0y5Iuuhy8DlJONz9r6
         mKJ0PCC8kmnPI4sNrS60lsZB2jGHceull2lSG9XXKzJdbToH0yoB2k1xIESZNo/04ijq
         MGkQ==
X-Forwarded-Encrypted: i=1; AL+hErEt3ikGVLA8Xl7n0knpU91U9pk//KW4Z561N7ELwW3BjKf4hC6+Y4WdnHypWFNQV1cSz9wFi3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v0yBi8wPr+LajIdvoorr2VKqbBg3sgp6vYwSVLg2eiKNUXPjD
	j+Bho9V3qvhagqJ+pr8JnKQbiC/s5/1vmnu9XOgvEHcVQtRhOPnF/gxW
X-Gm-Gg: AZFdTZdRb3Bq4XGX0NpOzUVmtNiFBN5hlkjTE3wxbDyDLb4JnLHeHGtJI6tjgfLXBTX
	Nl7QLGrZJtje8KFwGjaH7cxBLDH0EGHV9CepJb9oTwvsQ4A1SbtXivrS7XaRNbk1JZbMr/Y1GDn
	iCz88679Zd0gut+uN7F++Dzq9Eu8Ipk9CVjGfNvlSHJ02MKgbuHxrT1x736tUEVLKazyfgpaOQE
	8sxXERuX9sIedXFWqJUSL7zJJUT+qA2O+3meuilNdsABon/vZm6yWDdcys0Tqdlqp3Ch3Ubgj+J
	BiuH26VtF/n10Dx8VVL4BcQtEN+ESR0cOdOMlM6NxsSG+s2iqs9HE9+MPHJApgg6jU9Huveg2SW
	RYLQC1GUISeJZ+gN7948wcRTTEcEKPsFuxYqV2fZtVZVrja0LE6ymRxyiYBqlGNiuNEr4Brij0g
	NnDEd4v7GeNgCpgi2XrPleTu2E3g62MuhUjmJWRQQSEPpfkrFsexDDnHNGTmm4GtjbGyJLn6pix
	6SzdPpTAZ1GjHWpUVMYWy/8aQtCCrgpcnUfm7Tc3W1NWLAFx7TVm2umEfh7lpWjBozlWfIDoNWQ
	O7uFn1W8oyYyu5gjE560p3MZSBrPkjkoespC1wVeHNRJCN5EcXD/vt49mCcD7w1tPw==
X-Received: by 2002:a17:906:3811:b0:c43:eae5:ee80 with SMTP id a640c23a62f3a-c513a84f5e8mr1208263466b.17.1795619787223;
        Wed, 25 Nov 2026 07:16:27 -0800 (PST)
Received: from [192.168.0.61] (firewall-214-232.seh.ox.ac.uk. [163.1.214.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51beef9244sm6971166b.28.2026.11.25.07.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:16:26 -0800 (PST)
Message-ID: <d05aa4e7-5c58-4311-a85e-6bfe9c31c62c@gmail.com>
Date: Wed, 25 Nov 2026 15:16:26 +0000
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
Subject: Re: [PATCH 1/2] thunderbolt: add opt-in to preserve tunnels across
 s2idle
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Sukhdeep Singh <sukhdeeps@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
 <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
 <20261125132228.GE191152@black.igk.intel.com>
 <a08cb3e1-10a0-4a35-9258-cd510b91985e@gmail.com>
 <20261125143531.GG191152@black.igk.intel.com>
 <8e87af01-02a8-4714-827a-62c5beb6f4e4@gmail.com>
 <20261125145207.GH191152@black.igk.intel.com>
Content-Language: en-US
From: Tobias Heath <heathtobias@gmail.com>
In-Reply-To: <20261125145207.GH191152@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Mika,

That's clarifying, thank you — I hadn't understood the two-paths 
distinction. The behaviour I want on lid-close is Path 2 (runtime-idle 
S0ix / Modern Standby), not Path 1 with the TB fabric preserved. My 
patch is a workaround that patches Path 1 to behave like Path 2, rather 
than using Path 2.


On AMD Ryzen AI 9 HX 370, I'll inspect amd_pmc debugfs (I assume the AMD 
counterpart of pmc_core) to confirm whether runtime S0ix is entered when 
the system is idle, and whether any particular device is preventing it. 
If Path 2 can be made to work on this hardware, the TB patch is probably 
not needed. I'll drop it in that case and keep only the atlantic fix.


Would you prefer I withdraw PATCH 1/2 now and respin as a single-patch 
atlantic submission, or leave the series open while I investigate?

Thanks for the pointer — it changes the framing considerably.

On 25/11/2026 14:52, Mika Westerberg wrote:
> Hi,
>
> On Wed, Nov 25, 2026 at 02:42:58PM +0000, Tobias Heath wrote:
>> Mika,
>>
>> Because s2idle is Linux's path to Modern Standby — "look off / wake instant
>> / state preserved". From ACPI's perspective the system never leaves S0
>> during s2idle; the tb_suspend_noirq callback fires anyway because Linux's PM
>> core runs the full suspend chain on every s2idle. That's the mismatch I'm
>> trying to address: the ACPI state says "we're idle in S0", but the TB driver
>> treats the event as a real suspend and tears down the fabric.
> Ah got it. So no it's not the same as Windows. In Linux there are two ways
> you can get to the S0ix and you are after the second one. First is what you
> are doing now, that's suspend-to-idle and it is pretty much the same as Sx
> is except that the OS idles the CPUs and is in full control. All the
> devices (not just TB) go through a full suspend/resume cycle (typically).
>
> Then there is the MS equivalent that happens when the system is running and
> is sufficiently idle. All the "important" devices like graphics are runtime
> suspended (screen is blank) then the system automatically enters S0ix due
> to the same mechanism, CPUs are idled. This is what you want I think.
>
> For that you need to look that you have all the drivers loaded and the
> necessary firmwares and there is at least on Intel debugfs files under
> pmc_core that show what is needed and what states actually are entered.
