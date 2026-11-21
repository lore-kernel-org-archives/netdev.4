Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222495;
	b=dZXyptJz/G413+S+fK0UC6XuGSxckWxzln4Sxkg28YAxv6YGMK/7TAAcA8IQV3o81nQR
	 3sdAvUesnvrfUliMTUK9XX43W/olyBw15pWuloUoo/7x58ndf1LXSm0H1mGCJ87cpWeZe
	 RVxDopr/J/ezBODkcOX8HaT+Otp9sWWudQUtl9egw4aQG7Tjz8S0ZkBlc+wh9Tu+prZmT
	 QgAAEdKKXWPO4DbobXW4bivq/B+488ifgdGNlrmEuXJkbk66M9ZQm+cAgAowEfZT4lts+
	 dSwihbpzRb6aRmJnaYLP4Hf4WdK/4oJgbeZ4BhDRs3RzYh+zD+p+GvdxH2mDyH6dHSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xpjVDG5DIBxUNv5FmdAiwH/Mw+gK21icOFrFtWo0EwM=;
	b=JEAMJriSVqzHKefJl/a64jB94WZ/fzqfi5oxAajNcpBZTMpDAZa7xMsQsftCY31e2fq1
	 5RD5a7XAuWoWJF3bI3W9OtfwZns/sedRLi7vjV8EABae+3Iu3h9UhEQ/DcTETYQiDUfud
	 +Fuu7DxXyPe0rQzp6YjfJRN58k0kgqZni9iBcUHmzGDOTTzwcdin7g/r32KWjueNuiqcN
	 Ye9kyJC0oQx5ifojQ5YH26SXxsJPPcjYKctEwcyOr8uHx5G814vcaW7lxJaPLrvZw2bJf
	 PZ+X8Jy/i1PK8ttCBd65UD8bvBarbXJRRYMyam1B4JyT/gxkQYK1SQWJJWZTCdAc9IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yV+jdxXK;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD18606A6B4
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD18606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yV+jdxXK
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-536717a4d83so12152471cf.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222493; x=1795827293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpjVDG5DIBxUNv5FmdAiwH/Mw+gK21icOFrFtWo0EwM=;
        b=yV+jdxXKs8E1Ii5RBGD/Le6EXnnuK+YPE76MclgN0OHR5FWNo4y/CGY7dI/Hkg1LLk
         /RnGUYWICm95niXcS7wdCRb5nqUSD4jBdhcabnGYeehZOUhkZpi2dETK8YTqDqqJTKL+
         KGJXIVZibG8KIsQ3Kd5ugtIXm5DxxFnm2A7LLlgNwGhQyHrXm07HjPSj/3irCF7bZLHG
         1ZdhqP3q3QQBJ3SyYI7GsjyoGmnGyQfluo/qUNeiF+75Z36ddGQCfMN8Ka4hHmY43L6J
         V+jkPeyK5371tGa8xH8d765GNQE8pKngA89rssXM7sAF0t97Ng8HIPtdqR6I2Rdgt2pU
         gIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222493; x=1795827293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpjVDG5DIBxUNv5FmdAiwH/Mw+gK21icOFrFtWo0EwM=;
        b=GQV6iPAy6zwP3DlMrFOdRosg09KfI9bLUY8RaveJ77FE+7EuTkTwHpbKQqe8lo1s0O
         a4Hi8+dIvnmSb4yUv1ikNP4lPxXzQI/ApBq4bPMsKGmVYZ5ic45Wgb9r+JPTskvB/XRq
         YqQMxZs0V/EZEgfaqqDW6oLW5e92pOynaj5OOSokv5VBvxZGx+FqdHSvsUdEvf/JMaKG
         Hek4S/89TFQJibbUQRCr14VQJcI1/pKgfDgNC2T9/aynd/ZeMw/zHvksVRW1+CuWdojw
         SUrRmkuposxou5gFlkuJtXFeOq8Ph5CzZhDF43FMaeoh85Rf7t00rlKlZmUHN4+19qxM
         lBUw==
X-Gm-Message-State: APuU4Z/ubeBIsBoolh4xNH9oiXf9O3rWtxIPIorRHw+ZQJuYucsF4UG4
	xm6ifktOKGdt89EPOVIMzpp8ESSOKqluckTozGFQMmtuWLPTea6GUHwk
X-Gm-Gg: AYBFou1tGDCKmK1f26NLE6pNfKLGzfHETnukv14Btm90Ep5pHn8VBEFOXjlrRFg4Ow5
	/y2ZCxLJ5zxfBW04aCEYiPoQdc+7uD0nKzuSMJTip53IN4JC1zxEi75dgWT/7rOc41BaYCj8Iw8
	90guJtTt/7b9N9AKa0h6rDVdxOYu7pzieDQ7+2T4X7Ho4uopQdZ+YbDNxY9l8uQE7qI+MRK1o2+
	Vqqao9TxJV1iV26FDVDI5Lc/2pSkJi7AEWoseQHzc9cLcIuzqIzj5St0vFjsjUeRTs9Yd9SjheJ
	dJuH27aFMsUvk+O6sIZ7dH2FMYBxVXhC+cBteG6yNLyLDsyNCVBnnrrEINTKXlJryYFvdeuUby4
	maQyNSmtQQWEpwWBglhNnn84WjOYGuPTIvs1pkE4t3SOuI9y6I0TEuwVPAJ7+3jWVqIPWEllcRL
	saZEw9osXo+2Y4zxgML7UyO9I86bB/vPoZemS2uQseO/c81dVmIkio2zPp2jcPF5wqclywzhiX3
	TUThRa5nHKx+uAa543G+fKS2gqO3K2HSQ3Hq4H9qh0akqHNFK4g5sH+VI8OOxrtPRKV+cy5LizJ
	QmQh8rNVvMrbnwrZMhoRp2yq0wsZKLbkl0Ioh/N8xRA6bKDhBtkT23tX2Q==
X-Received: by 2002:a05:622a:34a:b0:516:ed02:c85d with SMTP id d75a77b69052e-55d7693862dmr90608371cf.3.1795222493469;
        Fri, 20 Nov 2026 16:54:53 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7c654585sm29801261cf.5.2026.11.20.16.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:54:52 -0800 (PST)
Message-ID: <189e3942-0a1e-49d9-aca6-88eb3aa5e0e3@gmail.com>
Date: Fri, 20 Nov 2026 16:54:49 -0800
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
Subject: Re: [PATCH net v4 00/10] net: au1000: Bug fixes
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Jijie Shao <shaojijie@huawei.com>,
 Simon Horman <horms@kernel.org>, Runyu Xiao <runyu.xiao@seu.edu.cn>,
 David Yang <mmyangfl@gmail.com>, Herbert Valerio Riedel <hvr@gnu.org>,
 Danny Kukawka <danny.kukawka@bisect.de>, Mugunthan V N
 <mugunthanvnm@ti.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-kernel@vger.kernel.org, Manuel Lauss <manuel.lauss@gmail.com>
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
 <179522240067.3294.10288163066827919663@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179522240067.3294.10288163066827919663@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 16:53, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - How the issue was discovered, e.g. hit in production, hit during
>     development, syzbot report, manual code inspection, LLM or static
>     analysis tool scan.
> 
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by LLM and not proven at runtime). If it was triggered
>     please include the symptoms, like the stack trace or kernel messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.

The issue that was found during testing is that doing an interface 
open/close/open would hang, every other issue was a result of code 
inspection hunting for other bugs.
-- 
Florian
