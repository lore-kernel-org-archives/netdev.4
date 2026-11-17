Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922336;
	b=UnibKW6W5ZAHMhPSej6nOLDFOTkp/uJH+nE9Nqc8q7Hwn0C8bdkV+IzNkx9OSdav5fPz
	 uvEx5zNHVF7N95j0rCurLiBHRVklLIa/Be6JqGlpf8DpFECGXwdiCP9yz413COT4mtO4C
	 9YOP9Ola9DelJENhmb8BDl66ux49mEWztBa2zcaf9tCMUVXf7g4YHAOa1lseTSDTEUQA8
	 xP+w0/0bBcPGt9ELC334pLPEDBkoCJOgmMIVuphE88YqT2y9XFIUOjXUQxXhhp2MdU1Xc
	 CSKLZ879h5qxLmptGqr1sGnE2X9FWIWSwmoF2otOp1CVmMgYGvDxeJ9tCSwqNp4P4AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=PMfyVSFJSHczQbfsIDI4zcyFUKmlT+Ekp2TFlgKyEx0=;
	b=ITZGul7htF+sXOA3KWeFUUYyZvOlFqKVpnZ6LdlrlSSJH5jFVc9Lp4CwmwqfaB4RFMKe
	 vItrBBZ3X+u+TNaFNu6dlgpGebYOICRCAWDWQqJ9UfWp1CJhEFpqwFjtRtYrOTKJdEXVH
	 T6z8cfbGOOLw/Xyl1Y/wiMst6OEEsbCwfo/lvULD3V/j5rAdU3oFLHO57XJv3O6B5o+vV
	 YodisPjf6GAijZsX2zVg5TDFUBqgJQqwvsa3+Zp3felhxJgZoVdZ0S4yL0uBFf8homdLi
	 RMZXMDODpde+3Qv3ROOYxggwhJl5gPKdG/ur7RNKCzcymMJlc3DTsls2nhbmSvYyo4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ffroot.co.za;
	spf=pass smtp.mailfrom=ffroot.co.za;
	dkim=pass header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZI1pqX3o;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C85606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C85606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZI1pqX3o
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so43313145e9.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20260707.gappssmtp.com; s=20260707; t=1794922333; x=1795527133; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PMfyVSFJSHczQbfsIDI4zcyFUKmlT+Ekp2TFlgKyEx0=;
        b=ZI1pqX3o1tXRzTKmLkB6C4x9BaihvhcmBqgab9Y7y6aYxyoy5R23z6f0Xen2G4JSlX
         BiiiB3Jq6Iu8bHUnwKzOnKvR48Hsmg1TPmP8jNOEk1LbY7E6CbyxXkmh/dkhZobA4iNf
         IQ2q9GFxZObZpKkoDCDQMP8zyPR1hXJWOc14XQSu+rM7RTTJSwwIW3wRBEf6Y++4JYNr
         /DghOr6nVDzgm3hyocSglUm6qoyXe/2jGC8sViSZmwI+dmSf1xe5sXLjIs8Q/BN69xbb
         jp1uCLO/kxEhlhN+oKXIU+FOrMA/VZvrTUOVw1sJLVXoZgh2MTeysBtiOur70t26mZfj
         eH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922333; x=1795527133;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PMfyVSFJSHczQbfsIDI4zcyFUKmlT+Ekp2TFlgKyEx0=;
        b=FqGs96Da4Njm7/nd4TkPJh1lXuJ4azcvyOVuaSWWHFjpELJBB+cySWd3fkuCiYoeKM
         3tRzZ7igcZAMu/2Zklorq7Tgx51DBh52FAtlL8frK8He/54M+84nzlmpBvQZeYV31GbX
         jExxznygBViL2VnmIQd96TVGePtgLMkS6cbOV0Aut5cCAJ7bzRJeMPV6HJPDFOEF9KbF
         mCnWNGmePZjSznY9s1XZCQY62MMBKb26nQ/p19ql4vX/Y5rUHfP2jmjP9SrAkQWtHVgo
         K2P5eLvYov3fBAte46b7gP2uiWIyvGRT6zF6mB3/zuEQIGxmqRROCS5EeZTqDyy1DrZU
         6o8A==
X-Forwarded-Encrypted: i=1; AL+hErGdFXTTzSkb3ZFqZrmMTHsOmRp/AngQ97nP9G/IBdCRZV1WGqtP/9cyjXGgPw7KEl3yeHNTrXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zX3zvbGJ+k3RtAfbXWE4okrXV8S94D1XxdTo71kwtScBZr7bK
	HGC9uHd59GXin8PtDFCYuOITy5ecFSix7EKcCRhD+P0uMxbFlrjd4J1YjY9gqDQgzI6W1UiizIl
	GOSAEVq8uNw==
X-Gm-Gg: AYBFou2WxL18C2bXrypTwi8bdAjH8wKDoNZwdW9wMnZoa4Vs8AtmK4oCvweEiu1Glrh
	zzqtErUuqaddjVZai1OBTrdxHrUs4ukYQv4hBzHQsIA+b1+7ayK/J2/xIJ7G/xF3DMY+FriYFeA
	gxWbL1q5nOg3cFeflKK3Ve3944W43LWcWPfDAPotaE/f1HKErdNJVGm0hEMUXYKigFllff9WhDT
	z6nDaFEdpLmEkJGuHdU1blPwrXNNi4kEZzdDYk+u1ichVKjRgp91GMyzvxi+5eiKN0xgCUgtw57
	boLEKxZg5evQEQQA34akATV4vgYmh63lAECoWHl61LkE7l6YvN1Ge7wleLfyyTkhiSt+zzMbMRv
	nSs/JVA7sEMetOz4qI/SfF/EeN/vCfT3+pttf3Kxyqmy9vIRfwgcIhw7n7ww5QQvWSV95A93mNb
	WRjlELN4sew/r9iA6qVmxlNeegkbtgsx7WiYR0G1kIWBNMd40nSZZKRArzpG8rTq0LNI1ssOQWF
	pW4A/CahpbllM/vlYpGzlND9m63g2w768igF7G2CybqBAmbFPQAcjg7Pk6ZZ0inDs0qc9/1O9Pj
	EiVE34EVVT/yrEh3n9HJS5wEfJ7pPIOnwe2pjeidl8yIKBD8WCoPZmqzoY2yRUu1rQ==
X-Received: by 2002:a05:600c:3113:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4bb55aabda0mr295716805e9.19.1794922332665;
        Tue, 17 Nov 2026 05:32:12 -0800 (PST)
Received: from andrew.office ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm29847753f8f.45.2026.11.17.05.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:32:12 -0800 (PST)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,  "David S . Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@kernel.org>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,
  <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next] net: sunplus: also fix the byte order of
 1c:50:1e MAC addresses
In-Reply-To: <20261117122857.kctlh54neeyye5vb@DEN-DL-M70577.microsemi.net>
	(Daniel Machon's message of "Tue, 17 Nov 2026 13:28:57 +0100")
References: <20261112123738.429728-1-ag@ffroot.co.za>
	<20261117122857.kctlh54neeyye5vb@DEN-DL-M70577.microsemi.net>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Tue, 17 Nov 2026 15:32:07 +0200
Message-ID: <sa64idfr3c8.fsf@andrew.office>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi Daniel,

Daniel Machon <daniel.machon@microchip.com> writes:
> The fix looks correct to me, but I personally dislike that double-loop. I think
> it could be smaller and more readable with something like:
>
> +static bool spl2sw_is_sunplus_oui(u8 b0, u8 b1, u8 b2)
> +{
> +	return (b0 == 0xfc && b1 == 0x4b && b2 == 0xbc) ||
> +	       (b0 == 0x1c && b1 == 0x50 && b2 == 0x1e);
> +}
> +
>  static void spl2sw_check_mac_vendor_id_and_convert(u8 *mac_addr)
>  {
>  	/* Byte order of MAC address of some samples are reversed.
>  	 * Check vendor id and convert byte order if it is wrong.
> -	 * OUI of Sunplus: fc:4b:bc
> +	 * OUIs of Sunplus: fc:4b:bc, 1c:50:1e
>  	 */
> -	if (mac_addr[5] == 0xfc && mac_addr[4] == 0x4b && mac_addr[3] == 0xbc &&
> -	    (mac_addr[0] != 0xfc || mac_addr[1] != 0x4b || mac_addr[2] != 0xbc)) {
> -
> +	if (spl2sw_is_sunplus_oui(mac_addr[5], mac_addr[4], mac_addr[3]) &&
> +	    !spl2sw_is_sunplus_oui(mac_addr[0], mac_addr[1], mac_addr[2])) {
>  		swap(mac_addr[0], mac_addr[5]);
>  		swap(mac_addr[1], mac_addr[4]);
>  		swap(mac_addr[2], mac_addr[3]);
>
> This should behave the same as your two loops, and adding a new entry is still
> easy.  Only a suggestion though, dont respin if you disagree.
>
> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

Thanks for the review.  I prefer your approach: definitely more
readable.  I'll respin and send a v2.

-- 
Andrew
