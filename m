Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754012;
	b=mq18r2zSJud62HQdAJ/lGiW00l/srxflW9rZ4ik7m/fqcC5SsV60EowmSW9R5jKZKe4l
	 nkPEKf0Q4d+K2bN0Iqf3Rx6pgV/5mZM8ja90Kaa2CLkoVl9ywEG4rtnuTCtwIExjSVa0L
	 40Hin3xtb7+7iDqo5IBKGQlvOlVUEFUh4XrLeh3Iw5r+V+XTfs+S1KGHzenGRVt+BfwDs
	 XkMm/gJ6xsVwmrQBTMhmDKIP9OeiDhhLmnBiand7Vl8AJLtweG6e1UgzegrgAVzm9iOhG
	 AuSzgT77cJWmSWLgQq1bmur3wDg7JPFp4T47tpsOds2zYAmTes6gs2iIAGvqhNKkpgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754012;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Vram2VEPZ6TSrLowbma06z/hID5VuOhEI/blIWrMXAA=;
	b=MB6Rhi4cI9XfzcsgpQRS0FkFSs2P+MWYBgjrjNMtuEPY3pr45QottANF361Cuqargw1s
	 qFGSkWRMiQsvTCOOElqnlma8FIvtmOIOeWQW1L/Gfltsv04k4E3wVfM/cfJNbyxrnlnwQ
	 8jxeGkycIoe7PYUhOP6X83lcPTbaYzOrCzQZkRxO41QIlLZ5exo93XTAlwTyudScvqIqO
	 iSe+4oyChS3qvjEJV8mT0Te8/+GeZ4WAfYqlfGwx3wOcKSo/w8jvPO8qDVk3XXiAepOuF
	 dASfz208K5gO+RisBXGBUq5RgiiWTACt6N/BamhFIKOj3f7i4kuIb9fxbjxDeGDnX8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2AE606A32D
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 04:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F2AE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ea2c058e67so8101702b6e.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 20:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754011; x=1796358811;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vram2VEPZ6TSrLowbma06z/hID5VuOhEI/blIWrMXAA=;
        b=fLIyJOno0FoAhVLkONpELHQXE2UzS/k6BxSqsvOHgti3X1lsK3J9phkyhN92aiC+I+
         VGW2NlWIUXuVlOz3kYiaTjXtkFG9Yo/epEjUrIWxo1lW1tWvltx7OUP8luRhwEd/rnUQ
         VWPSmRsOZiaiczeeXg3WhHx/O7SDMy+I4dqfgjmnmzQV6XaikwC92C93vKBi+A+cwdzL
         cPRTD1pQsJaZ/SAPOlHRxmQIqIzokMadwY4sP8Kt1yioE5JC0kQhRpovo27wOsOk335g
         ys/VlMc1Dbv/evudhfT4swXTosE232NHNuB/FXVYwCPTnI6L+IxcV7vOH/KKWPe8Acvr
         3zOQ==
X-Forwarded-Encrypted: i=1; AL+hErF/48yiiSOFaP4/uh7gh3DnDmunTH+ZZeMGdWHgYjAZKT6mhBGiAbiIMTdcdIxpajWyj6vnxS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z96ENyd/rgOIbA5tQOrYHdk4E0uUhRRJ+ykYScTyRrbdQ6Cv/UQ
	XzEMknkfdVkqadiihXZUI/QJmCdyVTHJBhe+wjIgjXaOH1ggO/sryNZMLsenG68OO7byhyvEU7y
	HDz6ER9nfoSMXOyfiELiVORhBBpgG0DHrAUem0DglzxjIyfllgv6PHixHo+c=
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3084:b0:55c:844:98ff with SMTP id
 5614622812f47-57a0a93940fmr26505143b6e.34.1795754011609; Thu, 26 Nov 2026
 20:33:31 -0800 (PST)
Date: Thu, 26 Nov 2026 20:33:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b09081b.904258e1.78503.002e.GAE@google.com>
Subject: [syzbot] Monthly net report (Nov 2026)
From: syzbot <syzbot+listaf042537503196db2c57@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello net maintainers/developers,

This is a 31-day syzbot report for the net subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/net

During the period, 4 new issues were detected and 5 were fixed.
In total, 51 issues are still open and 1840 have already been fixed.
There are also 35 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  21752   Yes   unregister_netdevice: waiting for DEV to become free (9)
                   https://syzkaller.appspot.com/bug?extid=e2af46126e0644cbebdd
<2>  1084    No    INFO: task hung in netdev_run_todo (4)
                   https://syzkaller.appspot.com/bug?extid=894cca71fa925aabfdb2
<3>  1017    Yes   INFO: task hung in tun_chr_close (5)
                   https://syzkaller.appspot.com/bug?extid=b0ae8f1abf7d891e0426
<4>  647     Yes   WARNING in inet_sock_destruct (6)
                   https://syzkaller.appspot.com/bug?extid=5b3b7e51dda1be027b7a
<5>  576     Yes   INFO: task hung in nsim_destroy (4)
                   https://syzkaller.appspot.com/bug?extid=8141dcbd23a8f857798a
<6>  31      Yes   INFO: task hung in inet6_rtm_deladdr (3)
                   https://syzkaller.appspot.com/bug?extid=55141a0ffa0d17f01c71
<7>  3847    Yes   INFO: task hung in addrconf_dad_work (5)
                   https://syzkaller.appspot.com/bug?extid=82ccd564344eeaa5427d
<8>  2081    Yes   INFO: task hung in switchdev_deferred_process_work (3)
                   https://syzkaller.appspot.com/bug?extid=d6bbe0f5705cb8a5aa2b
<9>  1202    Yes   possible deadlock in __dev_queue_xmit (3)
                   https://syzkaller.appspot.com/bug?extid=3b165dac15094065651e
<10> 1200    No    INFO: task hung in addrconf_verify_work (10)
                   https://syzkaller.appspot.com/bug?extid=95263979a9c3af871646

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
