Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786209;
	b=0rz6LE2s79VDze5jKhedlnPEE42/GfX0FU8fqXI9FNtK04Q3NKQ+Je9ullMuLe8k3uqR
	 DoHl81xR0sP5AqN+4l5KOPwJPkk/OAfhUQGD1AA+b5UsUYqJdXLv+mQzN4EmTWHu37Xw9
	 gWR2XyzpCbmOpARNd7N76+HRZ08XDYyLIFFR9b/nYLq5G1x+kggzmTILeyPl9Y45pPiKQ
	 xtSMnh08uerPE+dXj3laQkGvQnhKHIQ5IQEAJ/Q+pb1klI48JIe01udLWlEHzM0s3xm/T
	 uuTzyZxbZE6cwl7349CTtCkRey4lS7qSnSuQVTpx1KQexJffSsWIfpPfIG6jHB6+bzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gT1wk/EW5UkWtNt1mV/GP2JY7Jq05n1STN8XjDBmi1A=;
	b=zwHsB20Rs2lzaNhLqL4rue/MTyhOOhkltSeSrxOOZjoa5UDbAPvFIkRyn8g2GGfvuVU5
	 clrflwemPgj4HNnGvLZoyhqaZNox0fxFUzvjW1PIklyEvghqsRYr24C3ro942F/Drky9h
	 5oQ5lR287DLEx+NtYYnko5nXR1PIF6a2Buc89EY2/qDFLwH76eq/Qz82GJzXjBoc+987s
	 YE1xiNchdV2awYyPPTXvE8HkGhEZnBrjNLINkyNs35894DQHotXmY+/cmL9DvwmRToLBB
	 0iH/OwmQebBdVRnXMK/cyS1mp4fCjIFAASdhtL7ubE2TVt0BL11QU7Y0Uu6Z8cLfyEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owqBHRlN;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C572606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C572606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owqBHRlN
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c515369b627so876098566b.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786207; x=1796391007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gT1wk/EW5UkWtNt1mV/GP2JY7Jq05n1STN8XjDBmi1A=;
        b=owqBHRlNX9brkGoupsEPjMJ/YOe5lVhkLo/R9Ape0agdoJUGcj2ExyeUSwfMGX6Nz7
         2LcQYtu76kPD6ODzJ9getFml9dOdz0wAtt4C6kyFLCFZfnNxe7TBtqmfLGPp1+TmNqlp
         r9uTNr+YwKSZjooyoTs21f/DgEdf4sfO2HH8YxcE5wxQu/GEZqn5LKb5SBYzTu05RMtK
         DQaAvJZxNIBy9+RNQkCGjKhViN3qcXR0xyae8Lf/aZBGPTnNJO/ZOP+uRgpp+9+03pDG
         UldGb+IJjEnxlgD+WRjhz+0W+/1s1e4okaKkYWl2eOOozREzVNMC6Af2Xflu2mbRgzJK
         +iYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786207; x=1796391007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gT1wk/EW5UkWtNt1mV/GP2JY7Jq05n1STN8XjDBmi1A=;
        b=K7CuJsynikg32H+IchKizaJp+jhArfEB6BDj8WyEwutocWAbieGHwx1Ns0S2wAKbmx
         eZU5WsfshcMXTDhZ7jdbQeFqi+F/B0IDb3S0Y5+Y6d2jGRXI3xcMzCCwoopJ+Aj6DuNh
         TCGkStP1D2tgpz2dM7ZF7NIjnpnKiKxpe9PuyvDRRfrut3GUdjPkkBz3WaspwE+xTUjT
         tLXb6dlnZLsIV5BEkjtEl7BdzrildJmItoCzL3Sya5QKoBaHZ2zLF/FUnWmversZYOdg
         l7o83ibgo40Y2iLRR5jfl1EAEakepgciCJjMLWlkakMPTN2NbPKWjp4soiEhi03Y81Yb
         13IA==
X-Forwarded-Encrypted: i=1; AL+hErF8yL/lI2dClaLduoOCFsVobXS9UwX42gcT5E1UOTShWsEMBDZeNTXovtpfAKUbYet1iOMgLdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5ljqITZGcTx6LPf0GLt/9Te2NRrKXlRBVZpqOq4HA6g9qJP/I
	addSXdlJJl/7CXAc8aUrHkhdOcmIF5Jq1B0QbMEf6LjzcMb8Rj3dKkxB1o0vZqSaeq5xcQ==
X-Gm-Gg: AZFdTZdkR8z2zIK/c5UP/v2Zqnduf2gdpcx7KFjh58wEkd8wWrGZm6xbsUDCrg4aQDS
	9Gvf9ZBGOVlGjd3KhTCEa6S9WTfJi8Acj6xUq0DJyyScRq1Hc3wPF4wnMZ88AMe2MR2v2RV2dvd
	gC1quHscpjS33rJtVoigbIUoOfNLV32/6N50qh2jz0jrK1cYBkOSL41ILek14Hk+thtUrazf6hs
	1DpQMKSZAwZ/PDR3AmfDONmui8qpKE1ev+LsuOnfqTbrqSC8wZb86JbWLdjtrrH4s7nYLcL5c9g
	e5tMX7G6dLlxpM6JHAotUe2X/vN4X40OV82UnrVD6OGolikWSs0ipsvu7GzufoH1wf5GTyitupL
	d9VDGlbe2j+7K5sOYNR0m/jtIeHLJImEijdD0x4qJj4TdxmZ7kTFuvqiyltUNn852mTqTIJEIqc
	ypaNnNw+zAiE2RdnoNKXO5BgVCD+P4ZCpP2HboZbnAoKEUjBomx59L3H2ii81W7LevIrSxKJNvq
	LUfwL2sjeJ8itYRu6bFbO01NZ1zv7J4zbeaeuAZb+NwjaYhI4MahYs1WVObfY9PV58q6/GG5/CD
	IPxxPZ8a9CTAeDP+Kh1Gx4HrvnUkkhDWYX06cU1G6ft0rXbc0qJ0oFQx9SDQ+OTjHLm9Hu2CAbl
	VDfiTHuhan+3tkVoAEMAYDgQxJryeQoJ36MTmAoPbUv+6yGPfWajKBuwNDZv8DBG2iMBpztgwmJ
	5FWwGe5wkxHrPqnLpAUNrBZSTl9CFxzJb5ZCF5pl09EGhOIbYlitVXwjSLT9+2waU=
X-Received: by 2002:a17:907:a890:b0:c51:24a3:fdcd with SMTP id a640c23a62f3a-c513aace71fmr2108908266b.17.1795786207212;
        Fri, 27 Nov 2026 05:30:07 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm859101866b.57.2026.11.27.05.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:30:06 -0800 (PST)
Message-ID: <5ad2c46b-4ed9-4689-950f-93753fa1586e@gmail.com>
Date: Fri, 27 Nov 2026 14:30:05 +0100
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
Subject: Re: [PATCH net v2 0/2] net/x25: don't call lock_sock() from softirq
 in x25_kill_by_neigh()
To: Martin Schiller <ms@dev.tdt.de>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 Simon Horman <horms@kernel.org>, Lin Ma <linma@zju.edu.cn>,
 Duoming Zhou <duoming@zju.edu.cn>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Xin Tan <tanxin.ctf@gmail.com>
Cc: linux-x25@vger.kernel.org, netdev@vger.kernel.org,
 Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
 Shuai Liu <847807867@qq.com>,
 syzbot+300375dfd44665f063a6@syzkaller.appspotmail.com,
 syzbot+9faa82ae2e94c5c7d2ef@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org
References: <20261127-x25-kill-by-neigh-v2-0-c7cdcc9f1320@dev.tdt.de>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <20261127-x25-kill-by-neigh-v2-0-c7cdcc9f1320@dev.tdt.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Martin,

I tested v2 on net c5de2ce2fccd in QEMU with the syzbot config of
300375dfd44665f063a6. The syz reproducer of that report and both
reproducers of 9faa82ae2e94c5c7d2ef hit the splats without the series
and run clean with it. Link loss, restart and NETDEV_DOWN with idle and
owned calls are clean too, and your tests 2 and 3 pass. The same holds
with the PREEMPT_RT config of 9faa82ae2e94c5c7d2ef.

On the question of the netdev bot: patch 2 fixes a bug that can be hit
at runtime, the x25_recvmsg() case included. The window is narrow, but
a test can hold it open. A second thread owns the socket, stalled in a
userfaultfd copy, while sendmsg() or recvmsg() waits with the lock
dropped, and a CLEAR REQUEST from the peer goes to the backlog. For
x25_sendmsg() and x25_output() an RR in the backlog first frees the
send buffer, and the sender runs at SCHED_FIFO on the owner's CPU, so
it gets its skb before the CLEAR REQUEST is processed. For
x25_recvmsg() the CLEAR REQUEST follows a short DATA packet and the
first fragment of a longer message, and the receive buffer is small,
so the fragment sets X25_COND_OWN_RX_BUSY and x25_disconnect() purges
it again. Without patch 2 all three end in a NULL pointer dereference
(trimmed):

  KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
  RIP: 0010:x25_sendmsg+0x8b2/0x1580
  Call Trace:
   __sys_sendto+0x48a/0x4e0
   __x64_sys_sendto+0xe0/0x1c0
   do_syscall_64+0x125/0x7a0

The other two stop in x25_output+0x51f, called from x25_sendmsg(), and
in x25_write_internal+0x26f, called from x25_check_rbuf() in
x25_recvmsg(). With the series send() returns ENOTCONN and recv()
returns the data. I can send the test program if it helps.

Tested-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
-- 
Krystian Kaniewski
