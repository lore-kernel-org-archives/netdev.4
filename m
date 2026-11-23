Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444591;
	b=s6Y9n+hNgQwKmQDaPoteg3yHgtEyJ3FiMCgFM5gmW3o2s5jUzA5AmI/gWEf10KCpCCJF
	 wLmYezjua4vUk74HpiZ9horTy7I5axV9luhXhFkIUpNsQBsiLg4uFF9BS9ovkGF6LKZyW
	 amvvS6uRZfVaJOLKrI/mlUES/MiZsAzr4iYtXaPOieyxlGmZideRpfroVJtOh94dumh4+
	 JMYNmLZ94pPdeXGGseHb1VJqOTGZeypa+SlW9TMq716+MWuqElzv/F0JYII6EIAnUsoM3
	 uot1LlvIPq+Kwi05SZzPXpll2MyErgKenoBAf124P0wjv91Rn1r1mALSQa4vZvo4DYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444591;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0vSK+rEhIOTiE1e9j/UHGI1JrIFuyU+/Fce5zP6Fecc=;
	b=yljuoYWbPfeL4vjevvTM1XqabO2vuwzwvcqJY/5cP8Coes/9koSXL7Hpn8InBFOdd3l0
	 Oe/32KoHVRnlZ47BotciOCHWRH67qveObKlvHodZic5Q6B3ZXKWQyUio08oceSCmr60nt
	 mdmc7tDrNtDF4j9iVa/nYXiaS2/KWvnuj0P0LTqMvrXRO2j1CoB3PVJLciK8InAMNIl2u
	 2PwBYqwKRzAJmjxz7/OuapPrxr5JBNBJTEcaXtPf50SNj5Ko0JSGKjRE/s5MtU8R9kf0F
	 RR+pCWLRmZHx96dmIGgCWWLQ5Dh2L5X3dQZ3deZPy0GcFLa8IajXEF2BELqqo0A0noA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fmubSp0l;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BjxDy6Ab;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D157606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D157606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fmubSp0l;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BjxDy6Ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795444589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vSK+rEhIOTiE1e9j/UHGI1JrIFuyU+/Fce5zP6Fecc=;
	b=fmubSp0lTe2lBpHS7z32eowYgsfSVd01t21g+vVCpUNoRNvaPforfSKdyE2lStg75wzIa8
	p1X5W97+2QffiKSSBiXw7gEyA64GuB6hNcQ7Sirx7doKQ/FDBcMzA4I7tymIEWKjXFXFSA
	SmQFQOL4QUl937C6uPqGL/mEOOnDvkc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-G3mIpAk2Oi-eyM--GFKY3Q-1; Mon, 23 Nov 2026 14:36:26 +0000
X-MC-Unique: G3mIpAk2Oi-eyM--GFKY3Q-1
X-Mimecast-MFC-AGG-ID: G3mIpAk2Oi-eyM--GFKY3Q_1795444585
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49953abe51fso23391255e9.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795444585; x=1796049385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vSK+rEhIOTiE1e9j/UHGI1JrIFuyU+/Fce5zP6Fecc=;
        b=BjxDy6AbWNi9syiiWesh63AHHWJB2ob8mqmJVI03lYATnnN7gl7jFETQgBi3hLgHzS
         Wn4lrSch++eEjkSyF3RV9Ycyho+IB1h1BaFe58XLvOlmg0r3/PatbaJlB371eqqHmUod
         bm5k2vMOQI+DNJNorZGw5wDM1KlCxI1ggazU3VdauVNbUr2/Pef6MRDY5lwDLKCfXCgW
         Kvjfk2QvDK6kHwah3vpQGIzhi3zR7TrQHlxSdD8c3eysabPR6Crf5oq7ThyakNOqOZWV
         P0EHYa3EOskBwkKmMuF2dyi2rLJkFHlCOY2ew1a5NfJeAPGm4uBrQgmIbK2E5KSM/SKC
         L/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444585; x=1796049385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vSK+rEhIOTiE1e9j/UHGI1JrIFuyU+/Fce5zP6Fecc=;
        b=WUOAJZA11lcairw/XmtNLtWYuLkxQ9wVGQ2Y1CHtxtDJq1Y5MzgOYiMN+jVDQJKB0I
         9ygG2ieWw1uMGgp/chDV/WjJWX29TixEgNRnR5h+nb828D7pkPPz5dOKCiruxvusH7GP
         gQcHCNrJ+KO094jD1ikcR8cgNpMjfwzG8qKybc2IywcnmkMr57/nyMts4rI9IaJk6feX
         jGft6eD+At75k8zA9knU1P/FNQdrwH/ZU+oz93OtpB/T73pSAOHaMIVzWN4M+zz03EbC
         9I6thHss6dTeF/q58lskpdMXp/6n6yd46voF0mv8BzDlxYeDWTlZzNPhgD/4uBGyEHAD
         CTJA==
X-Forwarded-Encrypted: i=1; AL+hErGd/0rXauQsFRuzilfP2GTs/Vtv3uEhn92jlWkWjgPho0Kesb6FjX5KjtwsYl250aQ0XF+ncjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fRAr3cDv2JiN2MIrZEIy87uNqlIazTZ4GC/RMUbU75U9m01j1
	t0xEbRcqDvxJU2eUETsZPm+7n+bqz9AAwTeyNzz1r1Ffc+OY9spzr2rQgF6/7PXjiCLAzNV02Mz
	DXT5HYEXSU3c0hcuNYNFqokS0HzelhSuLpNJA4Cc9EPAfx+R5Is48jxLzjA==
X-Gm-Gg: AZFdTZfVE6HMEpfPf3jkzTloSGgpPYTTs7KfjuNtVgOduQQWe3SFCIwXezhj+ffnDtN
	B5GYNloGzUboW/snteZXF0gzc3QhdFdcHus8TgAtCOCff8Trj1HzX/83KJO4WuALmNQJMmkyCXF
	7VEFtjkGskOMpng7dlai4tMKS2XlFFXHoErpF1Xe0cv/W9HGKz7Ad8xI9mtY59FLBQ+k1Ck7qGw
	29tgPumy1hAGqjizVQ3pB+NPjyPADCifCuxf5z5AGWKmdzGu12MwBngyQUMZGydP3IneVpWIksP
	KsKbSTbLXihAItttrVR4JCDRi6tBL/RPxBvJGl2gWCKOpFit/QYHHS0vNP8ovJjjBxYtQcj+lfF
	eCv/bRbXv3TKB+co6Sxtsi5fs6tE+4T8xbsYWjJd6Vg7W/HFPYzsg7BgfnzWT0WVCZjfzTZAzz4
	4rbtUX0gZtWDgyP7V2e6VcHw7e0EuB60WbWnzasC4A8GoB
X-Received: by 2002:a05:600c:3e0e:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb88929c63mr223518825e9.18.1795444584762;
        Mon, 23 Nov 2026 06:36:24 -0800 (PST)
X-Received: by 2002:a05:600c:3e0e:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb88929c63mr223518385e9.18.1795444584371;
        Mon, 23 Nov 2026 06:36:24 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm346324635e9.6.2026.11.23.06.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:36:23 -0800 (PST)
Message-ID: <57d847e1-c6b3-4121-9438-6580ebeb821a@redhat.com>
Date: Mon, 23 Nov 2026 15:36:22 +0100
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
Subject: Re: [PATCH net v5] net: txgbe: fix stack size for PHY interface mask
To: Coia Prant <coiaprant@gmail.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 netdev@vger.kernel.org
Cc: Mengyuan Lou <mengyuanlou@net-swift.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, linux-kernel@vger.kernel.org
References: <20261117175528.3018609-1-coiaprant@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261117175528.3018609-1-coiaprant@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 18:55, Coia Prant wrote:
> The DECLARE_PHY_INTERFACE_MASK_ZERO() macro currently defined in the
> txgbe driver incorrectly uses PHY_INTERFACE_MODE_MAX as the array
> length instead of BITS_TO_LONGS(). This allocates significantly more
> space on the stack than necessary.
> 
> Since hiding the zero-initialization inside a macro is discouraged,
> drop the local macro entirely and use the standard
> DECLARE_PHY_INTERFACE_MASK() with explicit zero-initialization at the
> declaration site instead.
> 
> Fixes: 47f848aac4e7 ("net: txgbe: initialize PHY interface to 0")
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> Cc: Jiawen Wu <jiawenwu@trustnetic.com>

As already mentioned, IMHO this is net-next material, not worthy a
fixes tag.

No need to repost, I'll fix while I'll apply it.

/P

