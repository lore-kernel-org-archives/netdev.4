Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795161972;
	b=5Ay4fQYPKBYirfK/c4duyv8if8gTCRCtUDFao0fHkWuamexYLRUiecYxARBsvQTwWXzP
	 edrGZ4rtMJtUeK1IiYyQPdZ5paHvl/i5TcZ2/NzPP61TsnI6I7Tyu5gnPqKKEDYSn6XoL
	 UqY/YhlkB7t0hzDFjLsK88lWrYZVXOnVGfEy2V3ArsJzCM5LhqKYhnHtqdwAxMZDGjFnw
	 e/VqQd4X8B4CR/wAfFWEveQgkVOtphZS8zbM4X0+FV3sImzQu/9vuWuTYHPKdtRRvh7cY
	 dJjb2lZ3wxm6O+zQrDFJp6nTzEQcyG9aFkXGMGfskOnQyA94plK6NaS0Igpkr3LrFtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VsLypriGHYKlhMV5iYD5eFrEKHOuZT3YxctC/v+kE4I=;
	b=MqAedgjNDHs2aJp3kJTY0aIn91B/dhE+XnI4xVKDZ+tADF9mePNE0sQ9oGhYFkfxEd0z
	 XU0QEPY7zNJHFwvjL8YecBS8do31x/WSx9hTYCfUEtQFdf2XeA/FCdyTtXcVBgPsTA6WV
	 DQoZauej52AffQrA4RY5Z7mPlTgiU+RuB4aC9YCRaQiE7eUcb7BJLbymaU0szwkmz/Zf+
	 coqW0023mldTJIAYmUEuSLuLKpVcYPRO5dPeFaQo7DD7/st5IvK8+YTSWPUTuLYxNg6mG
	 G858cxiQmQ+am0+1a0XWmPpq6saw9rV3BVyERwG15ORIUWiHasbch0faICk0FPrq6OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWUfjfHx;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AE0606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30AE0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWUfjfHx
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd69954c755so463442a12.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795161971; x=1795766771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsLypriGHYKlhMV5iYD5eFrEKHOuZT3YxctC/v+kE4I=;
        b=OWUfjfHxuYt4V1jGwmz/2HCdpMlrlpw+tzw9TYEdKZNMXbwxyQjYJ+sH0XQaDzks0m
         UP058cznjWvdBiwpxJ/KxV6RTgdfEfnHBy/M7hPeM3j/ssgrfrwJMqTZmt0sMpDLdVaM
         jQLXT4AK6F1bzkZLDHjc6n7Kls/PLhz8Nuk5NzzckCYWEwoGZAYN2hkbpgIK47ACbR9n
         jvUvQOHLn0OE+ZR9wM/aBs3y4PkN51vnVUixwzic1jHyVL/l4ALkF1Zg6GE33uPlT8cT
         lCaQ2lpiSTHkiUHrr1H+qrFE8kbaTlLdFFpydq0scKjPWKbTomD/ObKXvuuJ08AP/vLd
         X/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161971; x=1795766771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VsLypriGHYKlhMV5iYD5eFrEKHOuZT3YxctC/v+kE4I=;
        b=uU2lTjK9zOjplPMVasG4vGUN8YAyL2QOyHow3cv+eetcLbgSM/MEbmU376QQEV/5xh
         78qZz4m/p0ccwe1iVAODerUA+BvOCyWT3xZSALl35Y9hKTwqkiNvyxChIOpS4RTEd0Xe
         LuKeZD9ULUXkAgg9vEUowvD1aHTPbzX4w7zw5DrFaCKZaFb2Dr8YDZdRzB4Z1pfy4MNZ
         C7gooAhVijKXnFWbtQNNnOKBs4+7uMUy0ov6DYEBQUiYdCG43dCKYQlMI1Mn/7iR5Pak
         JH9A8iayoaSyl8KT/xWUo0Ded45xavNUbWuIAS+3EeLuE4ZveSwdXWx45x/g+MEdJwfo
         o3+g==
X-Forwarded-Encrypted: i=1; AL+hErF0NjI7imkh060E1MOnqPAAslLFjgCRl2cahKdPdpM5vPk+BbwIoTVDyCT8TVUecbJHbrd4VGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nw3Ehcz9VPEMrgSgIY5RbPEBMcNtD8mihV55ebC64KKCgFqCY
	WaMPYiFHBSyVlH8MTvxtB46SlCOIP1tyt60evHcZsv/N5pVLhB4OLspB
X-Gm-Gg: AZFdTZf4AdBwaCdAFBvHpU5hMyLhVR+4GlraVNfZZAJmDDD7nF4qNraZkU1Eej3hRb+
	u5bWvazTnXF9C6ebgepPQDAdlCxJdKbtSJhZDG5aS/ndy+/7BjzTRrJnMkb4khTnwf72ISJe8KH
	Lo0dxpMr+yAux3PuGM2uWAcRqfmET1KxSK1gI2CMztWJW5l4D6Ggf15CUDlv8IBJVWe+qwB8hoG
	w+7jhWITAedYc0+u7s33SsbeCIRqdoEPCpA+G19ttTXKucISv5Kd80gMCsYhwCXkCP+NO4VGx6x
	8BHUjEPxfeGUOKyVaZxgbdby3Zm/WwK4iNwCfhzVTfZ5OekRL3Qqk8HQPfgSvq8f6ysPxloUD9+
	w3TIQ1Ktl03blsbUGp6te1k/jh2qtswWoi+B+ntPtJNi2/x3a9M+X5q2UfdC1JOeL736KV6hRVj
	nOM/zCJLY+77Ms5if/hIJb8JthjgR2glo0uxC7Og3ywyQ0Wa07kDSPBdITY3SASFr9hJrgFSVmc
	96Yr/KIiJK3kudE2xznvJGdaTdFfX95e7JLz7LGsJ6jFpoK+LAVsgEZkhdX/PaOuKMgyBT5kpbq
	LlayWPIrdc0pF8Y5S8D6lSq248O55YrY3H0FO+P0KZDX5w==
X-Received: by 2002:a17:90b:2fd0:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b41cb235aemr2207271a91.58.1795161971489;
        Fri, 20 Nov 2026 00:06:11 -0800 (PST)
Received: from revrse.tailec2828.ts.net ([166.111.83.77])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cde6d0285c3sm948556a12.20.2026.11.20.00.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:06:11 -0800 (PST)
From: Lin Lei <llleigoing@gmail.com>
To: matttbe@kernel.org
Cc: edumazet@kernel.org,
	llleigoing@outlook.com,
	netdev@vger.kernel.org,
	mptcp@lists.linux.dev,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	martineau@kernel.org,
	geliang@kernel.org
Subject: Re: [PATCH net 3/3] mptcp: exclude MSG_PEEK from receive buffer autotuning
Date: Fri, 20 Nov 2026 08:05:58 +0000
Message-ID: <20261120080558.2866468-1-llleigoing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cab39a1c-056f-488f-b217-194af2056db2@kernel.org>
References: <cab39a1c-056f-488f-b217-194af2056db2@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Matthieu and Eric,

> It looks good to me too, please send a v2 with the Signed-off-by:

Thanks for the reviews. I sent the fix as a standalone v2 with my
corrected sign-off and both of your Reviewed-by tags:

https://lore.kernel.org/all/20261120075459.2862977-1-llleigoing@gmail.com/

> @Lei: could you open a PR on this separate repository with a new test,
> please?

Thanks for the script, Matthieu. I used it as the basis for the test
and opened the PR here:

https://github.com/multipath-tcp/packetdrill/pull/214

I ran the test three times each on IPv4, IPv6 and IPv4-mapped IPv6.
Before the fix, SO_RCVBUF grew from 8192 to 50237 bytes in all nine
runs. With the fix, it stayed at 8192 bytes in all nine.

Thanks,
Lin
