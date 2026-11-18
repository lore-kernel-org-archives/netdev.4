Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008114;
	b=Gnj89U0wEYGc+cS7mtuW+e/IVIXQ9SfwKV7jNQsgbWAthxbji1u6mX5LWNyEqDo8DMK+
	 XMDLdnxDESYmxVEPbDH6+BqLIeObZ/Q2TLig61dY5duducypQo/+bXiSoEt2snoxoFE+R
	 mw0Qir+U86r3j44wRbwNJLhOecQlUGei0K/g1xbYVsY5ww7w6LghNh//Agctz8UK1FnBO
	 AHp+AhA0AoR4MXZwa0OxTpnElBlAuBS5ku3uyxT7IfnoltH9wacjCv9Iv+BbiUxISKfm7
	 03uk0jYja1iXgyKRuTPRoxP5UqSrGP74siXPS5hlc0EYEromjdBQbjbUFPLs0Ml7rJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=p7Dcs8rqFWgV7vy5jckJd9/OMxXaRSwC9PD3XcVQ8ik=;
	b=0RzOdEuLye8NVSu/2pqz7jCJQ6oK3AOAYaLrtAK5CD2PFqqniCAw+ssgiMLw6WLl1STn
	 GTXmZSPWhpOpgWALj7gfBLtr0rJYfC+WbDzeP5gi5utapaOXxZZAaOo1wcMTsHQzraqpp
	 S8Bz5UKVfCwONghBBuYolWnxlPDqQj1EYNfCYyVANE/GmK/qyMpuXndPqhnRnKwMBcTD6
	 1+7tF/VTECqFC3N9xRIa/ZKat6PbvnW/Cnf9tfAirgExAotraTSCDYKxmhUWH1hZTkVhW
	 Z54+BE/oLL0jZ4LH1x0nMopZdq8HBDKBpS/lVFDwewpzmQb44KYitmOG7XuOYCTS9iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Llmgi4Dc;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93833606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93833606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Llmgi4Dc
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so8857685e9.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 05:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795008113; x=1795612913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7Dcs8rqFWgV7vy5jckJd9/OMxXaRSwC9PD3XcVQ8ik=;
        b=Llmgi4DcPx325HGQxrpRFLWWHauQKMHVrrVD7XSd9t+wRFKL/4riBJzMtkOl4Sqate
         8nlBRAPedu7tq9EalZaGeXlImuSahc8dfswPg8GGEE3YzPp3sdhSV6jJ7RFp4I7U8uYs
         a2lnOfUXTfx+qXHUty/bX74ZYMZxL5CLD7texNThaooTfMG7J5PV/m0IIOdWK6SUZu59
         oM8pW8sZONvoMjT6EZBxzbhkqk6SLjeV/WuKsQts9/JSVu75NU8j2SQFk1GpXyIylviH
         T8w40rbeSXJgABpY0DdkI0umRKJmNojs5wX18Bj4nP4y48cDCBYVnHBIDbGyYqxTjuLu
         nC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795008113; x=1795612913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7Dcs8rqFWgV7vy5jckJd9/OMxXaRSwC9PD3XcVQ8ik=;
        b=bwAXQLijtgXZB0nQYjosAqzWjyvZldQJiRFajXelkkPD8eQX3qvQqdPbO4Ee4WJWn2
         sROcFW1sR37QZiU46rftXwFHW9YgZIi6Dk1pTa0gveZKuP2zck6Dn+KLpJc32lYwCa9d
         Pjnp0JlUKsEuePlFbKA6NNGG7fq6w2ll512GGcHLihQNbKnKI7Ghs8AkH2L9lfhd+YoJ
         yDpVbD2b9huqqUxWBhFRMJpEHQPm3gDvrn7KPpVrQbKeTy3FvoSBtt1BeT+HplM/lZIT
         VkIv8bVT+arucjr4Xp2yLrLw3tNYja33lggbn8H6Tq5OsNDxhP7CAtKo2FZlN47lewY/
         XhKQ==
X-Forwarded-Encrypted: i=1; AL+hErHbNh6gNiuWFghi3/EqS+EwzfpQkJOosytuw4CnD99dD3R4o4Ltac6/k7CvHisKWVzNSOGsQoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b0/EVX1H5yR7GFWjXxK/bO7qYaPZFfOc9jhmhKTQv21yhsSh3
	zwY44TnJ6EFUomSqQXWuvhqiQdyv2Iik49wo1knhvPvQkwHSthO7i6mc
X-Gm-Gg: AYBFou16LPfqvj4YI8JAFXRfQcbxR/6jgvqSq4WGHEt+1qtcTgOkBtY76D5gCltDVJN
	6dR0qjIA24jaFuRYLaJ7K/uw0jehTXHKnPnQWgzCP6gWvRbip+WCRczcuQ3Flv3oUBKnRopA8gD
	TdbG9foRxeIAFCJcFCqEHYCyBR7lcXGdHnaDXwX202J+53g2cMqbXd5AV15HKXQrOB1oVrbu4KG
	iOkHod/W5bsASv3O5VjXGgqn5og5khbI2ly+noFpWGX3jaSq6ZLF4RkBgYD68/ekLZHuCHNK1OP
	Qx3jSkVLY6DVpBX4KFrAWLiXjwbOcnbNMgdFTWX47GJ7JE7gbN2fD/dCC1ItKYLwrXOr2QcdPSs
	z6OA3UxJ8UfL/OmeHmkiCSFfIz8Eb+0i9bZRmnt6kstD5m3laVmDvNR5BUf6aBQI+6t5CUpwfEP
	SOmwg2m6rH9Vb1paI6+LBgdHitisFiYA4zkpl9JvPQtEviavD1hefPd05Q9BzkB/2FCPABxvVUt
	N+Zyvq5EP/aeDpsLDvIDtiuj2L0A8F2KnE5bQXZEb2zPpGfds69tvUuwXtzMV20P3rQi6FjVK1X
	LzDAFenF5NIUxXBF4uh3j2dbITRGjk0dntMSfMpvIuScq6DWc+hZd8f/lToWTUHRuIhiqYRbbi4
	uYUuTM5pnypHumSS8XRAUrcYtyEUjBB/P3pQ=
X-Received: by 2002:a05:600c:4f4e:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb7da0f671mr58393325e9.11.1795008112703;
        Wed, 18 Nov 2026 05:21:52 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3b3sm4899303f8f.23.2026.11.18.05.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:21:52 -0800 (PST)
Date: Wed, 18 Nov 2026 15:21:49 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v2 1/3] igb: fix RTNL assertion when resuming from
 runtime suspend
Message-ID: <rab7ustlezklu43vnjkby5mqh33bgqoztlz6bv5wxkjqfvbtfd@imjngi6j72nz>
References: <20261116153041.3002666-1-antonio@mandelbit.com>
 <20261116153041.3002666-2-antonio@mandelbit.com>
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
In-Reply-To: <20261116153041.3002666-2-antonio@mandelbit.com>

On 16 Nov 16:30, Antonio Quartulli wrote:
>Since commit ac8c58f5b535 ("igb: fix deadlock caused by taking RTNL in
>RPM resume path") __igb_resume() doesn't take RTNL for runtime resume,
>but __igb_open() still calls netif_set_real_num_{tx,rx}_queues(), which
>require it. An asynchronous runtime resume (e.g. after the link comes
>back) then triggers "RTNL: assertion failed".
>
>Skip them when resuming. The counts are set again on every regular open,
>which happens under RTNL; the only case left out is a fallback from
>MSI-X to MSI during a resume, which leaves the stack with more queues
>than the device uses until the next open.

RTNL is not held only on runtime resume, it is held on a normal resume.
__igb_open() skips netif_set_real_num_{tx,rx}_queues() for both resume
types. Maybe it makes sense to skip them only on runtime resume when the
RTNL is not held?

May I ask why is it okay to leave out the fallback case, can't it lead
to trouble if the counts are not updated but a fallback happens?

Best regards,
Janis
