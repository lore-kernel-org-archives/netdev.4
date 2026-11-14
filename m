Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794683009;
	b=Nfm6x9cYjOBciFDM6rpzoNRzkXNy4S+AMBvsxkOwsCUTEvrQq2yDaoppojNyJkt+aF6J
	 gnBc0tYo+Jw5TXmiJ0YKGjKcLqNulpZJFlmzkqRDIG380az5kbI5R6riShehUpHqfemgQ
	 ObEmNwyv1CeD0LwaaL35+5ynMTNLZYvhwpG7xgLy4tc8c6cI6x75Nvfy/+GJpz39xPBKG
	 Us/h7+necbfV3s1NAOeZ6TPpVr9UGFjAIL8u5JoU8FVMGDSNGIjebbBfz79qv0/XRWiLn
	 bjrGa0yWWRVXWXGxeXguIEZdHcdn+TuvsnPVm3hmk/cxRE4AytfcPBXpQTNYvuPIXJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794683009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
	b=JAWD3qdfb70ra4o6O7A6sp9J5O9PyxsehmPSfvlvFlPZxwjYRRmQEF0GrSbzJFP1EENu
	 1iudHZKJB8nCirQJHxwHuItl2/yZvUOQE4H/dBklhmVxOGeak/MA+JPYXtODGzuhdHYBn
	 6LwpT+s8O85/LTAh8AZZ56BMQGl+ADxsvWM/vUvKGN/Bsinv4Gin7v87BpuZhxXthBscx
	 EDJtdS/GiQuKzgICX9AXNY8we+gGGb/Chd0pe9eTp40QcxcMzR13fo2GBT3Pel3vqIe2S
	 WnsScpialKMeD9tUSgjy39rmbLMQgKvnR65yGfyf0OsWjebctoiv76ScJoSuYDH4eUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ed5/AR8L";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9073606A32E
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 19:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9073606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ed5/AR8L
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e977109392so12021055ad.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 11:03:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794683008; cv=none;
        d=google.com; s=arc-20260327;
        b=Dbq9eepIXQ311R4uGoNiFfg+q+XhVOu2cbPpCEk/Q06leAGIag4oni8HhbL7hWlzhw
         gNkb8vginfVpbfdwKBLAaE3nDTib5uGH/Cg03t7JIkWOoq9nCfQLWxQAFVgBE2H349bO
         0v3VzlmsW5YQ3Qe/BoJfEy8zAyVDPSdgOVkSL8cN57uFhUwCfca4hz3J6mTPxCK4zpTh
         7JcXgRurDUvAkUDcxP0+0zSp9bwoL8h0j/tWHrHTdk+gTjLsu2EQljaI51JavdzeX0bA
         2SVWi4gwqmMeOMUKM8bKIMOID3byl5oaf9Gxy35EAsw09fUd9PmjgfBR1W5+MT3o3o1V
         HKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
        fh=L7wyO2+eQK8IjdvCv7pk0ANMIoTXYG1DkNWSg8RXPpE=;
        b=iPTp7gFueaQ7SIO9tzxVT6MOI/8tLRvi/3pLKk8UC3aHnzJ77hHGFnxHiRDAN7aEPR
         CHGjDKcxMP9/rfxivjUXH1kWYshXq0qtyLnLSmIN743LUpYzwLMnItFYGaThMb2rVovc
         eqOV3viNv2FZHz0KedjQ73kBYeiCfmTdZ+YrKBw8hqCcU5UkYanb+Z/CtohNcB1Lf01z
         QG9RH3wuXxxWWluV8RlJV6zwUM/dAxXaqYKjo+wBcWbip0FBwoD4+4PwAMIdZZDfU7md
         LyrG1cVYL56W0I8XAfs77fuf+jmJe2S3p1ckx9hI9AOWf9u0x6OgIgvUmiOI6Wy9bKNS
         wn9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794683008; x=1795287808; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
        b=ed5/AR8LX1QZTDhIbHcEBTJRhK/otuKy09bVoSRxvd8kBmgwUeOssZgQXYCkbNWurs
         O3Xfr7yfulcOnUSCxgW1aQKeZ3OA31cq7m0BSRm3AMi0tHy4vJI2ecG1kFc7ff9UNmNu
         CukSzu6El2BTqrtQfdgsP8pxSjp5kAFtpLD7JI6ZacmKnWHQ1dOJZ4Ywf6+JIScdzIXU
         R97MZdgGTwYx+iMNuq+7Nk5SX9r86ioR3Yzh156PG7hkRdW9tW5VSIxSZri3ubgujlkj
         XKh+XKpHmx4GZvYiOAHwI3YywCo0ljTrUzKUfKsp7NnI4/yoRGTV4EvNZyOkBQa6UE05
         pOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794683008; x=1795287808;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uSLAZwuyq8QZnVN1hzVXlmJ3iH4sBJRLY1eaDnIkrUc=;
        b=Jlqu/a8musBMz2VStDihOiRiig4yEzlnrPgHeNSUOzmM0FeHAoIZayTcf9HHCh4/QU
         bqcyuuJFXBf6jemCdhZXXjFAPXuDSb34K5ULUKpOao2nXMDdyKi3DuHri+T3X1oYDGQ5
         rPDC3eFJ3WZgbMyFxhRh3i6Byo8OtarzHbQZtqUFebhj2UIv7JgMyJSELpJlrm9kIQpn
         ByY9pxOiGL8y4gqNyMsu7uc1EdVzdRFvJLRewSQLpR3rd/dKe7tId5CuP6VBpO03KmSV
         M6IO6xqtPSQjmhe+us+OKMXJsP/lzJQNCn4IBGrcv1K/u8fML44L8koTvMa/1uoy19Ik
         gp3Q==
X-Forwarded-Encrypted: i=1; AL+hErEUYdeTwvJodg7qMWSSjRFqjs7DZY8IlvE8CUQGEbOa9bDelcB07LqSDDrETipnAYq4FMp09l4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bWgIdA/Qr67FRyhz5OSCXntqs05iIRIxsL8OiqSCk0f+WF9NW
	BigiOQTTFABf1wzi0JCYi8dT07+krIuFxftSCn04v/RNXxeXgYg8cdtI1v7ygQbrct+yEuceya1
	DXXSPEmEzpjHzrhrt3MfKRGc9UvLV8w==
X-Gm-Gg: AYBFou2410beTcW/LcM/+/ixEI+zz+URnQlmro314RjyHQcT1yAPZOpD3q5pYC35Nts
	w629qp+Uh/l9pQgipJCVA8LY1cxqApvYtKn/eXN6CAmKIuEVF2U3tN5tb5h0GjIIzX5TAIydW10
	KDMYdqzDIDhQIpIPSzK9bpiER/BE49hYMbqTK8JHVz+Ln9fsV6hTznUqIQvrN5XhEs3bu/tJehb
	Tv47W3+k2khSaRN72akDqAba5j512rTKSGylWVBk1ZMD0Bdw3ZtgT8Ch4jNRryHUCPux3lA1NFc
	eEiUiiMX5iUz8z28KZdP773NmwBF84wfcyV8XDGnkigXApOh26ngx4S686jMuc8UrvmERrbfP2f
	JuXSYCEIzHJOPR/txj/vjopTpoD4hC20ybDHV
X-Received: by 2002:a17:902:fd85:b0:2e9:734c:5025 with SMTP id
 d9443c01a7336-2ee0da98dfdmr60035435ad.21.1794683008249; Sat, 14 Nov 2026
 11:03:28 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-m52xq-nfc-netdev-v3-0-725a61ce4148@gmail.com>
 <20261112-m52xq-nfc-netdev-v3-2-725a61ce4148@gmail.com> <5b31dcc8-8fc4-40ad-8c09-aad8d77965f0@ixit.cz>
In-Reply-To: <5b31dcc8-8fc4-40ad-8c09-aad8d77965f0@ixit.cz>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Sat, 14 Nov 2026 21:03:16 +0200
X-Gm-Features: AclHuK_Q0fCYoqErL7BMlQPVGQL9gfpYv5yw5VBHiZrfm9MfbMBI5fajd-Czxx4
Message-ID: <CAARotke1QDxr1XAHZhDBtq8nSqXzrbZk8pmdyy7ceK9ObBHNWw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] nfc: s3fwrn5: i2c: Enable the pvdd supply
To: David Heidelberg <david@ixit.cz>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

thanks for looking into this and for the schematics pointer.

I don't have schematics for the Galaxy M52 5G, so I can only go by the
vendor kernel's device tree. Its NFC node describes a single switchable
supply: PVDD, a GPIO-controlled fixed regulator that the vendor driver
turns on before enabling the chip. None of VBAT, AVDD, DVDD, PLLVDD or
TVDD are referenced or controlled there, so on this board they are
presumably fed from always-on rails that the OS never touches.

With only pvdd-supply wired up, the chip probes and reads tags fine on
the M52.

I'd rather not add bindings for supplies I can't verify on real
hardware and that no board would use yet. If a board turns up where
e.g. AVDD/DVDD are switchable, they could be added then as further
optional supplies next to pvdd-supply.

Does that sound OK to you?

Thanks,
Asdlerto
