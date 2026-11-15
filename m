Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765914;
	b=3P7bJKdZzM8691UQPyrUDVwNX5U+KzTDzKqcq3qjWu2OxaC3bW2PDG07NQs/P77Jf2kF
	 SFtzGzGR88x++tzWjiKidA+sxuU7NVQXJRySC2pAtdmuYTVIGXGkJ8Etf2c2KXI12UIAC
	 +OwntTJDyeaK8Tv1h2xTQAGCL8FXrjwxWX8L8Q8R6Ig0oUkBbnBu/hDy8n9nw9oPXAmMd
	 RluM0dUWCGqhTkIUuK5zT+6qtgu/qd+1ZYVbbXpDvDYBh6eLdfh5R9RlVRfEqbou3aJQF
	 vV+EEefQGCkFVi0Hid1VSJmaRON83ekwm2ugGZolwiscSuGOBeVlDA5aFdDPTT+9+JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765914;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
	b=LAVzyvNYPD/iINt0OE5lZsGA4m7g9qi1wnLgVDQVgL3a6Ob4jCi3KUAd//Ab7JbzYoNQ
	 5qByYWkuqGtS4NDtveq6hwcKKA2J3vian9TBme2kGsWZVKlZcP1FLqwxFKPkpDhJON63F
	 Es2PX15ggwpxvtbkrvTMELzdI47VskyY1NNLualNmJ8nvN4CjToDxYv0Gx8D2RKLwASW5
	 Hvp56Fi7a+hSSkKneh3erhgdqikJwUGG+ZZbfr9ZQqLWyqZ1QqutawkJcFLzbS0ss7Grb
	 zG1IeNxLWwtuaYxJ1b17FThP+TuZKp4clQqVrKZ9VLQbTtyT9nodFs9d6IMKkdY0vGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20C8606A32C
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B20C8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5727b04b81eso584733b6e.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 10:05:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765913; x=1795370713;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
        b=Uv1lDjIr0WnLPWH+PdXZPKSilOkC9FlSxINfAPBVBHT1iPrWqnmIo6oWgiJIBw8wqK
         u2rJRVWokhN38ywL39jxGRLfQ0du10CA11+9YumnLpugRf/Yrb8JIuIUuOVKi9zve50F
         eokh5Uw13QmwzHRjH4hCd6YbCl/8ogF54sZmek5Q7NBA8ourXVV6vavySSM0R/GIZbyT
         4xD1meYvejt/5GHGHBcySQIj5cLTJaFahMajeHDEC8aqMUC5Aqg/oHYsVDls/8ESwrPY
         9Tglae2btUkE/pNDsBfmm5dYomwqs4ANpwA02QITuDsOMSHfg99DOJp9Hof41OZKXrUL
         An2A==
X-Forwarded-Encrypted: i=1; AL+hErFqUv+WBs24NapkqY0F3txVCqS53Hc+iq9WhA2JGZMHYHGcf3mAAIN+Zt59o11vQTXc9c98hww=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dyupJnxNWZBi3Qh0lq/gEtL+dWp2k/d+933OiTLkjhOhrmucV
	aa12n+fQF4JwNQySuP4JR5hESplVQyPcN4VBNHSCJ6rlO7Jm/AMj+p02AsK8ALApnky073jBT/D
	mfK9egNhs3WKMKyQXGkh1KBRjCuz+zAWt1IfakVWjJdupY0NyUPRdWyAz93Q=
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3013:b0:4f7:f874:8cba with SMTP id
 5614622812f47-56e64f0b01amr6807339b6e.48.1794765912805; Sun, 15 Nov 2026
 10:05:12 -0800 (PST)
Date: Sun, 15 Nov 2026 10:05:12 -0800
In-Reply-To: <6a88e933.ae6ddae5.3da009.0047.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af9f458.78cd6c47.117a81.000c.GAE@google.com>
Subject: Re: [moderation] BUG: stack guard page was hit in mptcp_sendmsg
From: syzbot <syzbot+2b120190d9e54ad8c65d@syzkaller.appspotmail.com>
To: chenguang.zhao@linux.dev, davem@davemloft.net, dsahern@kernel.org, 
	edumazet@google.com, horms@kernel.org, idosch@nvidia.com, ja@ssi.bg, 
	kerneljasonxing@gmail.com, kuba@kernel.org, netdev-bot@kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-upstream-moderation@googlegroups.com, zhaochenguang@kylinos.cn
Content-Type: text/plain; charset="UTF-8"

Auto-closing this bug as obsolete.
Crashes did not happen for a while, no reproducer and no activity.
