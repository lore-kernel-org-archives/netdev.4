Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795394952;
	b=Qh2Y5PGsw3YqtAeC1qNCr44XB3qxFhIgvN04i0RwJC/xFABjbfCx4NvK1THas+TVFizm
	 PcqholySR3zjw1K9ACdifRQUr/j007zMo0vpI5pXHQ+G7/DSY2hEdgjWMAqC8/aVY6Qlp
	 w7v8Fd8k0HAS/ExdYykeUwYqK45Q4r7Q/l98JjpH9kBnGRK+6TIg4ZgfBx0LMP/8bpzbD
	 uCX09a4sWRJUpRfADIITLMUHQ2esvssjgyKGAujxDnbpKMM128jLLwxqxJdl2Tr8TgAcO
	 4KCSkPF3S+AMtVUWIh8iypQMORgUc2I0mAQ+MYtrFGrG8zszSRHhTa7IL+2bAU80Zrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=f5qjBMoAO4jBXR8/b0YhlthlXetGuAcfTr8ec5NafHw=;
	b=deP2AT2TgWDfZQaHEweHSF+EThqKZnld/I6JNEabHj47Tq7tAD6diUVelrHxtvA2NHFK
	 RRwUxkzuI4wWvHMGAJtdrx9QPUodcQPMA07XLxtafRCVvVe7AE362eubaOiwWXOccCxsG
	 fhj3Zglq6sKR9I1Q4uGj2EQB4R/8bQlTdcfb7xWMjRBrxWznmyaN1PwkszuC3VJvHWTwx
	 0c5WLH1WNHiwY4LIUQG5Yp9LCjT/sAcz/gJZOcUIXfpXCfMilsv72gYYZgATf7aMTroKx
	 TCfGMMO6+p8ATCfqJyO2uWXuzGOms/w1vUBE9Arp2hQ6w1wgOagKuJtYnMuqFDjTXZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i6Bzeyv8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF20606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 00:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF20606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i6Bzeyv8
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c51373ae637so413063266b.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795394950; cv=none;
        d=google.com; s=arc-20260327;
        b=SLC0+H5zBPFNa6fpIWHUcBjZwMdQrGe6TSPGQWtJniuqznOwkVQAjwgg6r3OZ2EPIP
         20Z1kf3M/lG+C9vuEP3IAPPqxmIO3Dv9jH01xIXDGnaqDwI8NjX4a6uab8ehaqUyenOF
         g9+ivEGfLiZJJqRX8Z+2D/unLGDk0KAgI6pFVmlKH5bnRgL7oREl8iwaTXkwmi3217Wd
         i+Rb3WEsAIsxLeoPem0WV5rt5CALxvsBLAG3QX4L+FXFocqK6IaFfILM5M3sH/d9kmst
         4DflfGcBw3J2s/Qinu2ZnNhSB2KpXmE3vR1h9q22WfLyU8MGIBFW65bXXXyLG5MhB32G
         G/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=f5qjBMoAO4jBXR8/b0YhlthlXetGuAcfTr8ec5NafHw=;
        fh=tCbebW+1+b8GVwUBADvWshhzVEvmaWHcNyJpTPIJRN0=;
        b=ciibrf5BXYaqJs/SvbRbKg2wTwX96qAsAFxtf+Ic7sKwOt7ytetffzU50eYCQQ6G+/
         bFNyedKB20HEz86zDORfYraTCAeBgtULDvJNdrZAelHHpy49Z+2ioYgY00AKM1ApLifU
         LrYZmUh55+ZWwKRCLmj2S9WEw1CKQS2AsikEVMsMeOvdB1aHZvWnbmL/BV+UmZ4QF8xq
         /T9GZMM7S43r6u2ugcyzdS32/AjpQ7n+lwG1dYQZ7bP3hLyabPIeHMy3BC/+U4jZjSy4
         cF5hapU63rAo4UdaZOq2QH2H3AoGemybdVhWXCzVdxckYdiEWnVthKZgpCVJRuyy+22g
         wYpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795394950; x=1795999750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5qjBMoAO4jBXR8/b0YhlthlXetGuAcfTr8ec5NafHw=;
        b=i6Bzeyv86mdMgsesGOxqIPDNX7x7CxM6zpvptLa0BVoyunZY5o9TzG+V/1Cc2A+P8p
         MNShe1xD6DNSWUJ68ST7QrA0nl/GWNYYOMPTthx2UyalDEbE8MT/VNG6Eo/XQHali8qw
         pYkJT6iX6B3WbIlzdT1r5au8unG7fKI3zPtG+E6uvwdQHA1O/uDc7wpLs3EygsQTjbQn
         ElXCGpbwJLNefed1epDVcokUoUavg8uFiKiJ18F71E0qHX0T9jeMaO/Hr2MKmILv9V9I
         pfkAyNLYAQKFMFHEjE61y/++Fo5nuJNB+Qjf91vHSO18mGOa3pWxBvL43+ukGa+pAwGi
         Zj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795394950; x=1795999750;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f5qjBMoAO4jBXR8/b0YhlthlXetGuAcfTr8ec5NafHw=;
        b=tiBW0t41dFpI6vgbivBM0NERmKQZpqxknMDXeAYJnNowRod+7hQsi7lG91tClE2qoL
         +bO6uMJhVyenNznIbH2WJ/SCBep1kGKSWEvsesxdtPWzrC0d265gIJrwNh7qLFJ/hMLH
         1/0bOF4FladpGeHt2H59OZRoIZlhpQyITN3vAT0R00JUe2wD1JvjFXj9JlAocDh183uA
         EJHqsB1pJ1VCb1wwqHWdA3RpLmDhEuNwIZ1vOWie4oChgioIPluBxSfau+0fZFf3EmKr
         takM4cEG2DxSfqZuAsy/0HLfTPpnc7OX6ElgEXbtAyIHxDRR9h8i9bQhmrJ/KE+nxOXP
         XcmA==
X-Forwarded-Encrypted: i=1; AL+hErGpPOHWzvreaha3h0szCiCM0mtuoRKadROjsLPwJo6tOlA6NXdTeb+3mZEK9IPfB6lnJLVuGVk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gjdEU1t6ffHEPbBd+vJnvuPBTY6WAxmtc6aHO0oA7Ct9EgIl7
	ZcMycnlpJONOV6TpfhFIyJaJFnFMvK6QBq6fjfcEbAx/36ZpzHhVbv1SM+q7R9sh6sbOA5D7B90
	Q7YEfmPPogW3CLSKzMR0EMVtQY/JW6DE=
X-Gm-Gg: AZFdTZfnIWUkTjpaSX/tGqePLlaY5SCRgo335iPRofy8APvNd4taEYgZ/GDmZWv83cH
	jyFUXlKKrcfO0q/6p3CANhrzKJUS9RZfUc5Tqpw9mm3hmizPYuSSTugHLbZj1TW1B3nNZ6mw899
	O5lSmEhCV9R5Fhg/yHbXMMVj2d62YZsdTtmwVTqOjRz1da1hiynpnNEBAwnSbHJpRkjCfyVWig+
	RNxqgjXS8TYCrVcRho0SAwxVhK34PIdbd0thqd2E6g6VRSFh3GXkplCkzpl5ZKu9ZaAb9CFJmtu
	+D4oyEEkK9Ym5cjeJGMxry+t/ohcbSlx/UVO8B6sFSD4nNPzHHD6AhNj2T/w3kEwC4H8SXbdjz3
	KdzxzfK5VzSXXWIM2Eu8m9cqvp4N8g4arY7eHp56wX9Rr+Q8uTa94PuQNtJr5DT3tvA55ei4RBJ
	FZOsNQI87T018lxKaNSLj1nV+7mZTW
X-Received: by 2002:a17:906:48cf:b0:c51:638:7838 with SMTP id
 a640c23a62f3a-c513aad0dddmr571463366b.33.1795394950064; Sun, 22 Nov 2026
 16:49:10 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Eugene Siegel <elzeigel@gmail.com>
Date: Sun, 22 Nov 2026 19:48:58 -0500
X-Gm-Features: Aa3M54ppxhnAFcxuldWHOjy1ZaCs6phJb8TeOEdbF3lhpRK3_VauRio9txwm7v8
Message-ID: <CALkdYjV9G2fPfXK7UYTe4FuXNUBYD+DbM6caVtBT3CAULHHqUQ@mail.gmail.com>
Subject: tcp: question about RST at SACK right-most edge
To: edumazet@kernel.org, "ncardwell@google.com" <ncardwell@google.com>
Cc: "kuniyu@google.com" <kuniyu@google.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I think because a TCP RST is accepted if sequence number matches the
right edge of right-most SACK block
(introduced in e00431bc93bb), it is easier for an off-path attacker to
forge a TCP RST since they don't
need to guess RCV.NXT. If the attacker gets a forged out-of-order
segment queued, then they can also send
a RST with sequence number at the end of the segment and cause
disconnect. To forge, the attacker needs to
guess the sequence in window, ack in acceptable range and know the
4-tuple. The application I work on is a
distributed network and it is possible to know the IP addresses as
well as the listening port. Finding the
ephemeral port is discussed in
https://www.cs.ucr.edu/~zhiyunq/pub/ccs19_tcp_model_checking.pdf; the
SYN
half-open queue side-channel they mention is still present in Linux
7.4-rc3 (aebb72744764). Our application
periodically sends and receives up to 4 MB so the window size can be
large and makes it easier for an attacker
to guess acceptable sequence and ack numbers. The attacker's guesses
consist of two packets: one packet
guessing the sequence + ack numbers, followed by a RST. With our
window sizes this is a few million packets
compared to up to 2^32 packets when the sequence number has to match
RCV.NXT exactly. I tested against two
computers running our application and it worked as described. Is this
something that Linux would consider
hardening (perhaps by fixing the ephemeral port side-channel or by
constraining the RST if possible)? If not,
I'd appreciate any advice on what our application should do. I don't
think we can use TCP-AO for all nodes in our
network because some nodes are behind NAT.

Thanks.
