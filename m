Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437995;
	b=EwNlvZFxCVL9J0b9TTn5AynNZnjKGAj39nBF9mx1pHlxUISRQZ7RWleHFqFlasp8exp8
	 riQNatqXj3d8b+M1WctZrIfP6M7fr1io3vlK8IRBJq7fzhZGF+kdNvdUuSWHycgve6yvb
	 tpobd/aY99UUWLF9qWLJLBgDf0lf/XEU0TJdLve4q3sxGZLKQYjAiubR5u0OWtj+04eKn
	 u7B2UckeBn/oVkOH3v+bT7Fz5N0okbJzi0JuRASgNjs8CAGtKTDAZ9hQm5eYinhmHqWBy
	 CCIVlFsoYiTDv4FszLgrYEt875MyCA6PW0W75BJJ8d8NNA3lfICdtQHzshocNMNIK7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:From:To:Cc:
	 References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xljfEW1ARtv9O5fRWcQQ3fcCIsF2gNs8iXKa4wamXZc=;
	b=DEMdXV27BWsFq2UDTMHIgeBv2Ohbcsd/CYNemfu7NYd0gHgIRSkgKmtOKBxZo/d4BN4f
	 zDrxd/yrUFYIUtDhdXi3SaqF3NYGzYcwIyGcQjpVTVq6NF3iipv6Gfp5NYWKub18U2tVQ
	 pIZ5rQ1F+HE/BNg8h3EhPVdHjJ0MRU8bh30TICDygc54afMQ/dBcA12ztXFEtG6ibtugy
	 kNf9A1UFpvDXBaUOtgQeCCyGablgXNMYyK5Q6stBzSkRzzcGNbu8Seh+Do3w5fxT/c3Te
	 CJpeXc9TNUPrZ20t/yh9TmGSrcEJ5k8vglNi2mEY+chDgYp9a3ogb4nCKgA/ky5JhKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=GJVK37dR;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69437606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69437606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=GJVK37dR
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so31423695e9.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795437994; x=1796042794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xljfEW1ARtv9O5fRWcQQ3fcCIsF2gNs8iXKa4wamXZc=;
        b=GJVK37dR/Q9siyKu+M5KtXAt4XhqexpGLl+hNEL9JqcddI3JkinJ3I3nfYnfLSey5K
         7ktANB7NPwGSuSqoUgbhMSVgtxc24op6IxqQ8P2bWCnZER/77L9pgti0UttXuvFwsVX7
         kB/gATBIYMCzf2UaWGn+3p1+JzrdZuQdDs3O1Dvrr68fu4ustwKfW13Xvvw2qbMOu0gI
         /+ORJl8glpzDnCRG8tEA9Tg2UVeXfYMW+p/jO0PHc3DjW3G6DSdA2PGXBdG/zNNRqC0c
         xRtpzq1B0+bXGgmpka9BCPcMdv7lctpyZLq8gXsM4uH623uJAhmGrSKQic+2/J+AoXUl
         DhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437994; x=1796042794;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xljfEW1ARtv9O5fRWcQQ3fcCIsF2gNs8iXKa4wamXZc=;
        b=08+xcOQV+Q4gB4oVW7paNDZ4tiQF+PQoYe7whOgJiWF32TQatzchDzsmUYWWE4XKMI
         q4uK17BwkYR0/opYMCCEnFzihfXU3feZBMnmChYTi3PAQqQZBYW94j3/IgNvSSGrpOgU
         exsai9RNpz99wXbMckkgZynRFWerIfZnNz+ljM+g8MFbIcLD7E7c34Ok84XolnyT9bVj
         shcuP0NC2I4b8SkuG6mvuqgfndWPhB1svOMYb5BTXA8PY0DkKxapZ4LWk3LOhqEiH1yw
         BBMAAiMo/U1/cd+QhvPTZMDbWTliAtzlU9MQDEAV72IBYkWzbNVvXNQeKBaKw0CqxPuT
         mGDA==
X-Gm-Message-State: APuU4Z9FVotzDJWarT6r4xUT5PSfCVwC0XbmwYZRB4z/JNtwx6/gUqvh
	dNocrBFkBIYS0Zq+8v3uyDf38NNGHs7jk/j05jYCjRUZTCDVq+enIxbuzOXXKHQe2Hs=
X-Gm-Gg: AZFdTZeqZyS/1a83LskIWIs4MbNTr9D9b6QZxsJR4VrFxB1bBKSJ+sHu/VChqhVCtyF
	8m9PSUM/6uRgiphvkbOnEWvIBFEA1J3OORitQKI2cwWbqUdhN7pmnH/EmKzAPBaZ285wnPwPEU+
	Sz0dF5si5yRIF4I0hTQ4IuekcX2E4idSyo+bhJx7AquFnQ4t+C2y+Jms7ZMSUbxkW3e6IHbeeIT
	vTMfD/p6BzOaFGNFbYoqUKPAs3F8I/mOaQn9U7ElQDOBPpo5teAyXT62NPC+bZPLJDP5QdWjYUT
	881ZZRsFlqpNokRkl4UbEOqm7bO4LEY/nCX9Sb5o/vb+uN1FnwC+6TG7Hjg315/zGviIN1srurq
	V1LkMrCz5vOViPl55dAr3SkVX/VLAA9TK581Z0tipVW6Fj32mDbziR5BtdgDY4akegUZ7l+Zmcp
	a2OqPxl10hJFM8+hJRIlhdoafwTPKo+VNXQ742eTcdoJ3oPRuNTGFXA5NJktVW6JZMwUp4e6T2G
	1yVDq6k15tnPPkHpWTpU2Cw6Og5G0CDvpj4/yf9ZiauHrugTffVs4lfwSAgXeLJOda5ymSt+WDH
	hJcVnYdkKC8X5EJqOcb3OV0EpTFdndKPj8ed/AmYs9q1+DWcNLzzpIZCc67jSHr/8QoteQEFH3X
	tfXe9
X-Received: by 2002:a05:600c:4e16:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb88813024mr239666355e9.25.1795437993515;
        Mon, 23 Nov 2026 04:46:33 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm399417215e9.7.2026.11.23.04.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:46:33 -0800 (PST)
Message-ID: <a0180b86-cd27-4a1c-af55-ed7ff09d911d@blackwall.org>
Date: Mon, 23 Nov 2026 14:46:31 +0200
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
Subject: Re: [PATCH net v3 2/2] bonding: don't let an 802.3ad slave change its
 type
Content-Language: en-US, bg
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Kyuwon Cho <kyuwoncho18@gmail.com>, Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
References: <179535729502.2645501.5219010464870440@gmail.com>
 <179535729502.2645501.271186140389290426@gmail.com>
 <20261123032537.GE10218@Liu-laptop>
 <179540710966.3093990.1416762538136490909@gmail.com>
 <9a533d71-7c7f-4946-9f5b-444db8737547@blackwall.org>
In-Reply-To: <9a533d71-7c7f-4946-9f5b-444db8737547@blackwall.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/11/2026 14:43, Nikolay Aleksandrov wrote:
> On 23/11/2026 06:29, Kyuwon Cho wrote:
>> On Mon, Nov 23, 2026 at 11:25:37AM +0800, Hangbin Liu wrote:
>>> Hmm, I personally prefer the approach used by vlan and team, which disallows
>>> changing the slave type after enslavement. If you think we should only disable
>>> the 802.3ad-specific part, this change should be merged with patch 1, as they
>>> address the same issue.
>>
>> For net I would keep it to 802.3ad, where the type change leads to the
>> out-of-bounds read, and merge it into patch 1 as you suggest. Refusing
>> the type change in every mode would also make the enslave of the nlmon
>> device in bond-eth-type-change.sh fail. The test would still pass, as
>> it does not check that enslave, but it would no longer change the type
>> it is there to test, so that change seems better made in net-next.
>>
>> Nikolay, would you rather have the general check?
>>
>> I will send v4 with the two patches merged once this is settled.
>>
>> Thanks,
>> Kyuwon Cho
> 
> Since this requires purposefully breaking the bond with CAP_NET_ADMIN,
> I'd go for net-next. About the general check - unfortunately I don't
> think we can do it at all due to one, rather weird, use case that comes
> to mind - nested bonds. There are setups which use bonds of bonds and that
> will put ordering on the setup, potentially could break scripts.
> 
> Cheers,
>   Nik

On a second thought - the bond is ARPHRD device by default, so nested bond
would affect only non-ARPHRD setups, I'm not sure if there are any such setups.
Just saying, it could be a path to stopping all type changes after enslave. :)


