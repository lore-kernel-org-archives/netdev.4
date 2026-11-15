Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794746010;
	b=T3mvkQxn1/2W3ySQzpA7d58sYi+KP+9UDpwWXXC3qD/pCXtnE20GhLAEcVBP6D+UxdXo
	 3Nylf+DWzub+exabxh4eQBWH/yc1mAKgOVAzU/EFNOl9hY5LeQaFdUiatcXBVn3BxDPxs
	 k5NUArDnKTBQhVzRqaVs7BGfx6xZ2LUKhBHVV9iOXyhgKT3YtpIOh5z+7bOXyNTbcXpPA
	 GSJm4GmjDb4VjvKzKUPWJBYkXmZ3a76EEhilJhY7BtiP0GRAuFg1zWX/ayBPk5SCFGQjL
	 F3fdUr4c2eFfHyNUGXgv6g0jfyj49Z+3OcE0jq8x7Pgh9Qv5gtNHgZjvZE+3yPDJo6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794746010;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=P0L0ftbj+kIt53ureHmiQ7Y/IcbNESkfV8kHEr8QUa8=;
	b=qjB0ExHiQWjCvIOyIZP+LahVVn2VnzH2ZNFbnBSPtxvknFx+O1LiEnIiwDmHX7ySy/8E
	 fzX+H3ERhro6uLFNoCJzP7KhBf6pI3B8yWvS09Um20UOYn4kLSJSiA2P1LwPahFSxic8e
	 SjYX0epl5c1LOCoWVLVIK7dVuYNU3U++KE8P+Ne4Yjnssm6p43HwvcTqcticSeFPxnLM4
	 NMQ6ZS+LawuvLaVJXp5ipfvk/R34DepstGJw4Z+mn/63pVk8Pb6cUqtfZWwh8O2d61R7U
	 yOQJZ239AKi0FgSwGmizwq21UTXwBDvZBMWPAfWR4+QRusCs+U5lwPNM05ByhksLEJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AEF606A32C
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 12:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39AEF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-862ae90bbdfso946148a34.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 04:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794746009; x=1795350809;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0L0ftbj+kIt53ureHmiQ7Y/IcbNESkfV8kHEr8QUa8=;
        b=Ig/g08r3JjK92qpe35fcc0yZ9/KbxoOdEke7327FqWCdNB0pg70jd3DrMTiJnuOUbJ
         NLA/cuQA8YZDIF1gMDyIWG2xXE2un99j61PJaRf5raOypu4zW0yURgeCNVd8ZwPspzGb
         A6+vrr3twtKY3FCkwgqBYPtt/CW1UH/mWGHeQ8EZZ2z1M2fvVN+iodXzGTKdkkazn7El
         0EBV3ZDRe2RkLs4xUtIdLZBInIMxwL5wcH66ZOEa6FXzYk71++3xe+5KHkO23yENXPCr
         Rwez2aVlq9eKVuy7NmurVSd1uMq+HfhEFOb/wZo0/gXP6UmVa6nsDOdNmqvz660dSH4R
         NXRQ==
X-Forwarded-Encrypted: i=1; AL+hErGWNaRJFt++m/Ij/5JgrL3u9e2XwsN1weCqqKpoIJfLqxU5sl2TlOG3fDW/Vab61ejOgq6oYL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9InDphM4dvnxDuEiMCGiPPMXUUzK0167+NN+/iyUb82ziDYKlI
	QzM4IQueCLSXko4O6P9nWXIRW8wjjQWyu+mrbirMYWvcebhhQi7ye78KAxmLBFvpQzZjnqALbBh
	JI5ifiSLb9yhcUEa+EBnvnKMcOGPd3M63o4ymDBk1OEZVHgu38kbAW4yBLxc=
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:e88:b0:55c:8ed:4db8 with SMTP id
 5614622812f47-56e65a413efmr5878322b6e.62.1794746009242; Sun, 15 Nov 2026
 04:33:29 -0800 (PST)
Date: Sun, 15 Nov 2026 04:33:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af9a699.78cd6c47.117a81.0005.GAE@google.com>
Subject: [syzbot] Monthly wireguard report (Nov 2026)
From: syzbot <syzbot+listd270b2ab9f81057c7dc8@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"

Hello wireguard maintainers/developers,

This is a 31-day syzbot report for the wireguard subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/wireguard

During the period, 0 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 21 have already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 111     Yes   BUG: workqueue lockup in wg_packet_encrypt_worker
                  https://syzkaller.appspot.com/bug?extid=ce2a09d03fdc079a46e9
<2> 60      Yes   BUG: workqueue lockup in wg_packet_decrypt_worker
                  https://syzkaller.appspot.com/bug?extid=d0d2f1a65f45b319d25d
<3> 21      Yes   INFO: rcu detected stall in wg_packet_handshake_receive_worker (3)
                  https://syzkaller.appspot.com/bug?extid=48f45f6dd79ca20c3283

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
