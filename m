Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660138;
	b=2Kn68FFyZgs1dSj8/3h6agBciQ9kuxt7/QFkjbn/0iZ6YWe2ZtAITrZXKzwJUwzDBDkI
	 DIGcDVSKEI1zFV4rKQcN6N8Vk/ZJXZ5k4N7a/j7a0nBI6T+uapiLm688ORx9SJBgmQcQo
	 URqIIXtLF1tWU8cIe1aTNEuBIw3FOPEcM3kTdbiuz9W78V93kQdx5md6IX25rwDoVrvR5
	 5HjLNdfREbRULi9Z1kBzz3qVaIfKpkvhTxW9HFXJtnyN8jgsdN/Boaj0wDhkpsCvTp5Ls
	 +9VwgNhl9Rzo8Z/6dK4r+t3SMYjIFsIckW/eu0/KpIztUsu8QlH4Nt3UkBYaOYx30qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=C4WPmCztPH+KoFhzb/uCAJwlkmrIRFMhr6hpJOKutGM=;
	b=3Ti2DfAOVkhYra14eBnoGXCqutPNpR2Ay2DauFt+lRqMysicC1VZY5VRedV93qG73yOO
	 1O/gv7tUUAkwnQ9BSYVb8QM5DOHKX+VaTdkAujpAduKclEMzhWw2KFWy/UG29p2vihksk
	 Azs+tbvlQV+m4+VhRM8MtWJdOUhog4NPr/LKrO+gf2PQt//M3NwqxXZbfGwNjD+e5M/Sd
	 DVDztpca87Wqe1Vd7C3Xa1gdj564rMmKVbTm7Uo9PzvDi7Pt1WeCvJt62IJUDVbnOfof+
	 I0m+vit0LtJ/wuGlvUNv0Ivv61mjb+lWM5APrv4qCSVruD4KpwQxA3A+4nHEcfBuYrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjRgsCuA;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3238E606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3238E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjRgsCuA
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1438d9363fbso977733c88.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 04:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794660137; x=1795264937; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C4WPmCztPH+KoFhzb/uCAJwlkmrIRFMhr6hpJOKutGM=;
        b=QjRgsCuANNFrlvin3D92M2sMsLDO28F5Rz/dFNYzpImcK+hth7ZUAFAfqgm2cDEOTA
         rHSWlbG9Pmgd4pwMUOfqFwGECGjIHM26mF+laqI4pBszc9MjquWfPH7/7540zzFa7cTD
         amzn5sF3ezrYD/7TYUp8lAoijwqHCjy9OUhzzjHDX7xJ5OlFmMfB7RW+30WDAro/5VN0
         1IWOVigmc/lOGXztMhFSOGsTLUC+UuHNf1RM/7zlUu4wwvrqlQJfW8X01u5EgN6cWvtU
         eaKPdNLR4puGqIWdL5aRH2pAx20BXITPiS+bSQeu57eHzPyOoG4x+9wddO5Qx2PnFLKz
         tcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660137; x=1795264937;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4WPmCztPH+KoFhzb/uCAJwlkmrIRFMhr6hpJOKutGM=;
        b=r2HgnA2QE8oRuK8SPG/wb7XAI7+/7mrfw1G2q684LUP4uYhKf0XXdGZNeLVbFAa05U
         S9lOZGqago0PLs7GsDBkae0gOyMUAw68PQgxnRyvWoedOBhZvZBgBHKGZdD+MtX1EY/c
         0vthYg6q6qScKIpRV9HvSKe6jdPFmnu47hyz5ENV3S/RCBq0ct2NgIBUWSqN2xl68gui
         WfGkAq+zSBA5GVM3MWKF1GjCKHSDP4DBJ/gNmop+avvRjJOCzXlq80aFbpfgT8fGqb8x
         PNxUqt0gJX0CBbGmVnfwyrrBMwPgGgAA4c4XC2Di9hVIKrdJqOX7okhwzfp2xhQpH9xk
         ASFQ==
X-Forwarded-Encrypted: i=1; AL+hErFdBLlPQY1Dn4wXr8BlY3ZD3/U6qEmmjHrmG/krJNmvuNGaUSYwMDiFQ31U8HTAk6l6tk/Xuo4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MKD3+bVqn9YWzLEAc6DlPJ+GqfUetgKUy4UbE9Z+29MldAflW
	J6iUth26etX0+grDdkVWwegBa7ogHP+4Xo4yFznC2UPoRvCVbnSEaNfR
X-Gm-Gg: AYBFou0jtFu54i0bpDchOrrJB2Qkr4ZxTEHsTI1/E34310iHINuchrWEYoILdv4GWXI
	csIYJtQ8I9nT/OW4ML6g0Go6hY9UnsCASx8ngTqYETG4zcJ4F8nFrJY5HGRkXA5q8slIV1Pbnca
	hFj8CILkWD5c5BnwJzNvIwOZyPxkfdQvVYlX2bDF655jlaQPMyTc/TFVnL3xdp4KiUMIXPmakmY
	Y5wtBkZTpkzUpdY9KXgp32loH6fNk5dmcCDJzT4BFEmo3n0/bfHCpZA4qQNwYuvf+xzsLzWOjhX
	y4IXB5mYqFlUkEgzkH2EUp/VQyjDUrgD/PHKssKvLKvJ1RGK3JCdUcYWz7bvyYqeOhmhfMlWxxC
	JJ/6axtDY1KBuX3y3kr+tp/XiFAdQSOFo1ldWR3WTkvD+gH1lU4vtViMvgDM7YpIOhdr3OIHVDn
	jIx97XR3H5plUpQkSggIlEUQnF50c4btYg5V3T8BokwAYTcU2vDJ2XF97k6uBm5EMgeNFHUcIWP
	Nex5lEowCEyP1N9lqJ9h+yNRwlBlhIZNuLi9QwXe+zVB5LhMmh9710bpUSMZq0PwUAX+//+/5KN
	z4WRWV6b0KP0gYe9VT5B0cQL4q+wL0XUTNzDgIreCr+jpbXVe5xCwzN9lS7wnkjjBoo=
X-Received: by 2002:a05:701b:4294:10b0:1b3:b3d5:566f with SMTP id a92af1059eb24-1b5030990dbmr5086025c88.11.1794660137166;
        Sat, 14 Nov 2026 04:42:17 -0800 (PST)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm16550060c88.14.2026.11.14.04.42.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Nov 2026 04:42:16 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH net 1/2] tcp: avoid wrapping Fast Open blackhole timeout
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <avVX-3s3AYwtxQe7@google.com>
Date: Sat, 14 Nov 2026 20:41:59 +0800
Cc: Yingjie Wang <x-professor@outlook.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "mptcp@lists.linux.dev" <mptcp@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "edumazet@kernel.org" <edumazet@kernel.org>,
 "ncardwell@google.com" <ncardwell@google.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "horms@kernel.org" <horms@kernel.org>,
 "matttbe@kernel.org" <matttbe@kernel.org>,
 "martineau@kernel.org" <martineau@kernel.org>,
 "geliang@kernel.org" <geliang@kernel.org>,
 "ycheng@google.com" <ycheng@google.com>,
 "weiwan@google.com" <weiwan@google.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <EE7A0514-C23D-43C0-9C38-CF15CFCF8AEF@gmail.com>
References: <cover.1794325665.git.x-professor@outlook.com>
 <340d9f1f96e235642e8b47b5e7c836a18de8dd56.1794325665.git.x-professor@outlook.com>
 <avVX-3s3AYwtxQe7@google.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

On Thu, 12 Nov 2026 06:15:12 +0000, Kuniyuki Iwashima wrote:
> No one wants to configure 80 days blackhole timeout.
>
> Please apply a sane limit in proc_tfo_blackhole_detect_timeout().

When picking the limit, note that the product wraps long before 80 days.
With HZ=1000 and the maximum multiplier of 64, 64 * timeout * HZ exceeds
UINT_MAX once the timeout reaches 67109 seconds, about 18.6 hours. A
limit of one day would still wrap.

On 32-bit, time_before() also needs the interval to stay below 2^31
jiffies, so the current expression is only safe up to INT_MAX / HZ / 64
seconds, which is 33554 seconds (about 9.3 hours) with HZ=1000. So
either the limit is derived from that, or the u64 computation with a
clamp has to stay.

The same applies to net.mptcp.blackhole_timeout in patch 2, which uses
the same expression.

Thanks,
Yongjian
