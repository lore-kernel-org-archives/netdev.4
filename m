Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408172;
	b=Q73KmHc8XmvB4MR9sr9iKJaXaRbUAMsnViEQb1ncgrj1qIPHaYga6nHBF5CMwXEJBzx7
	 hvEnZsMJLM8zVt4OcAyXbCSRqOL+rXqomipVOYpYgVGDQ+XgMXLzsPGVC3YCJHQ4dPaaZ
	 f6XM5M/TpBOLcK62zw/ourh7tCwYzeiktzP5QKDQQoO5Fkj7s5VVI6utnKFI8Q+ZmU4Zj
	 XTMXk6LB5tlpXqhbqfpjSF+2gio+2ILTpz67SyjUBR7Mb4CjncN693tUlWVQXLLXCxm0C
	 t9dtENbYlbBW/15GxEuKrktaZuOhs6a0Oe4laNPuufhAbiU7MrheDG9qIwmIks9mnBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=BGWy1pjF8M7tvt0E1vHaI6fHDpcMXUISfZ4Pwpf8MNk=;
	b=b3z+VEylkGaqg9VDaDmIpwRCxL/RUqqMEsD1fpFnZ0hwWsnp3gJ/BrHP/HKbsa+Q6ue6
	 NOlIIxUoFp7A60HnNdHMe6+6T97mLoo9++O0j1ibXLle3muX1vU9m7TfI3VX9+NExq3c9
	 Np04FR+POHQLLZdm1+JVHvJvubX8rCkQort3dZfj6RtL7iIpGo4Jwm5O9PEXmhi186MCr
	 WiJZEFUSPimgNVj+drNqLBRGQPgFFdx//VbWxiVDgt/JOTa4GKg3Gv9lqY5KeZQVBnHah
	 gU2D+XIufXp/P2WyytEdaAhS8XoUvNNFyG7HbXMYnAs7mO2Q1Y7gr30sBtvxmvBR+5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycAU7qou;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0264C606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0264C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycAU7qou
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3446971c88.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 20:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408171; x=1796012971; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BGWy1pjF8M7tvt0E1vHaI6fHDpcMXUISfZ4Pwpf8MNk=;
        b=ycAU7qouECyNA9bMClDxuXfr6DZs0g1Sf2Pg0WrrDqUMPpsrTt/AQugiJXguy/X6em
         YW18LdBkW5AU7bkwlnHDdoLydhAxBt5ZVBhH3J6M2zbpPx96pGIzvZfz84LmtBp9KBcm
         cMrjl3PTPjG3K2bOf2hIZ42LwvrFfZK+mRwYr0Uhk/KOiaTfsgjIc0gyrGmlhyuUTLEG
         nt6HvTPEHr3VBdL3jSX4ln6VUpLDsDwHOEzI0JNGbx5dL1RDpuPnOnSsVQg0rhsQEBkr
         K3AKQa4Qfs/SspzV02Gy6iI3lFlQqPsG/hYkoRmYOnoedIQtukVJMFi62OIBfH94kbtM
         +iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408171; x=1796012971;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGWy1pjF8M7tvt0E1vHaI6fHDpcMXUISfZ4Pwpf8MNk=;
        b=hNEN7PXrFbxpRKFDYNny0dzUjemesYqSw5AL1jjzwq8Ef+e6jPUgGoxl1LR50/pDQL
         G6QX72tk2ODyVc7RN0v4ilPObZ8gwtKXAArlQM7j9+QGImL+4V4V+dSSDuxRU5ExmVXV
         48x+KguoMHdFULWc/qeqqHAvomFhH0ka4bSucVcELzeMtk7IekDkbNrOHf+Fz9SmXV0h
         Cn6mMSWZJk8vxPmfWJy2+W0xuDfqC/x7UB+PMBF0VGwXF2QOqhjDy/zFMRJHb5lOOzVS
         8HX9K66KJ2ousItsZCvsP4Hm00Gfvhsz+v3g48m+TO+SoLZ7dmKu06yOvXbLKekGkqsB
         jlnA==
X-Gm-Message-State: APuU4Z9gW6mUSE87DSrZsFJPkDBxp3tgl33nfFr0LtDUXSrA3D2GmTAk
	+BKQ3lX8Ryj4L2brErGmvfhxm+Qberr/vB2QJy2qQWmZVCwhzlWxeJN5
X-Gm-Gg: AZFdTZcKm9f+7fHJNJFZqy5qwcZowt9/WS/QFnH38L/VDQGiUxHOJR/iSyB3cNAPNBX
	jqnrTjZGt0b9DpNMDARAK23coxMyIlShNvJOYodGWkFkR/4osUrSlTB7oI8BOihcnnnf5xSp1ZZ
	knzhDfdubtRPB9zACnaim3ZiVQVL12YbghQvfWcqCIi5x3GnqubTgwWWUoplPvql65CxSFF+NmS
	fDkRGaK3HfScaruprC1KTkhMSD7lBdqeXwbVN4OiQUfscDI63CDWtcKhxVAQAHCnzsKGCab8W8t
	XoUPevmm8538f0tjiRQV01N2zQGLlXt5h3PGYbVnwnnVrZRBogpOvfDEY8adVPr/GkGk/DOAKS+
	0/ZiwT/2hbAxLnyrpbDBjpwWXUCbw3ADuwuWqJyJBJSeJhIG7ji+LRIlshwyBUX77OWbRPwtdjf
	FlQlJagnqXHFsA+N4YxiZcZEdnoaw5xh2YsBTFW+3T+t7mFS3jvfX/NEN4TBd03kJgqeVyTQjZ4
	RAhOO62y+maV6Mn1rV0k/h7VLKMz1L339/nL8PoquyjdxfYEqcI6cvLHC+mK8bsB9f2De4=
X-Received: by 2002:a05:701b:2091:10b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b556912a4bmr12148980c88.32.1795408170982;
        Sun, 22 Nov 2026 20:29:30 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm39902948c88.9.2026.11.22.20.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:29:30 -0800 (PST)
Date: Sun, 22 Nov 2026 20:29:30 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net v3 2/2] bonding: don't let an 802.3ad slave change its type
In-Reply-To: <20261123032537.GE10218@Liu-laptop>
References: <179535729502.2645501.5219010464870440@gmail.com>
 <179535729502.2645501.271186140389290426@gmail.com>
 <20261123032537.GE10218@Liu-laptop>
Message-ID: <179540710966.3093990.1416762538136490909@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 23, 2026 at 11:25:37AM +0800, Hangbin Liu wrote:
> Hmm, I personally prefer the approach used by vlan and team, which disallows
> changing the slave type after enslavement. If you think we should only disable
> the 802.3ad-specific part, this change should be merged with patch 1, as they
> address the same issue.

For net I would keep it to 802.3ad, where the type change leads to the
out-of-bounds read, and merge it into patch 1 as you suggest. Refusing
the type change in every mode would also make the enslave of the nlmon
device in bond-eth-type-change.sh fail. The test would still pass, as
it does not check that enslave, but it would no longer change the type
it is there to test, so that change seems better made in net-next.

Nikolay, would you rather have the general check?

I will send v4 with the two patches merged once this is settled.

Thanks,
Kyuwon Cho
