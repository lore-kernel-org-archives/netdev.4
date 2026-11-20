Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145071;
	b=vJeJPs7KmNZTJ/MLPfEiRMqlyM1VAezzU41nc5KwbFdT7QWR07geP+lYkwsm4bIJuSTL
	 ExPKObXHaGHDpSHOD91ySaDwMCLEQz4qwxfch1TDNYN74TgmOe9bkzO4IMJJ0ue5DxWvB
	 501dz9c2/dVjHPE2JKppc4hFtwO5lAvxdl25rxzFdkIzwify7FndskSzm1aO6elpCd0Tn
	 fnr5gtoqF0tIMTwXyp2IMubMqlfJZMLOYX7DpgERISoUvr9keAJRLJAn87CLA77T6+jMM
	 Wa+cgPqB6RRmYveWGtMz+qSXVJJA+JEqW18rgDyeOVDh76JI7PDbEHn6YGWzJlgfRRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145071;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lWmVntrIFoXWuEfKzXPEnvIKPo36ZB3yBQ2S17cjBQ8=;
	b=SJYug6z2z6nb4UW+5Fp2b+Vj0KDTgwoW9GSZMkWZEkSLS5AON5bAi8QclNiHWudv3ReR
	 m0FrB1Vgd1xjqFfUxz30G+mF7Q39I8WwMOLBfh3w/tyi+oVdan+iFuEz8ChPGDQvhUYDa
	 Px7LRJrJCSjP0FaAdudwBdWS/xOFc2tmNgNRg/Fx+ZqTZtdPndT7ISzuIDhUF0w13gRjB
	 JMQXkxjH9i/uWVfKUHEydji6G1o5hctGyIbwngpezQZ3NtB0tzutW142UIkE0DD8ayCoE
	 aOHE0roBWI+sprmp3d8s3Z7zJ8BilWhJa5Oyv+KnEhaU8xtMoI7lh59kmy1llbVugsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="BNCwah4/";
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7835B606A332;
	Fri, 20 Nov 2026 03:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7835B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BNCwah4/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=BNCwah4/adTuA5Wn6Tz8XF12SZtr4pJCtmi4F9cXoablMnOB2RtVjgpA4W6aoK/gEQ7qzRsKk7A0w
	 flo43uQtTpkesiRalOSWyIMfOgvrRUWuWGXN0RWQNfIACxWAj9nSSIGA4kSxUGLcda9zdZ2SWfTBDB
	 XxHXTeQ2dTwtLvRE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96affbd63648-29056;
	Fri, 20 Nov 2026 11:24:20 +0800 (CST)
X-RM-TRANSID:2ee96affbd63648-29056
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.net (unknown[223.64.114.161])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56affbd626f0-139b4;
	Fri, 20 Nov 2026 11:24:20 +0800 (CST)
X-RM-TRANSID:2ee56affbd626f0-139b4
From: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev-bot+sashiko@kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Mahesh Bandewar <maheshb@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunwenbo@cmss.chinamobile.com,
	1342116488@qq.com
Subject: Re: [PATCH net v2] ipvlan: update port flags only after ipvlan_set_port_mode() succeeds
Date: Fri, 20 Nov 2026 11:23:59 +0800
Message-Id: <20261120032359.18592-1-sunwenbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261118175701.GO860048@horms.kernel.org>
References: <20261112064821.85624-1-sunwenbo@cmss.chinamobile.com> <179483705411.3136.2665029224845053782@kernel.org> <20261118175701.GO860048@horms.kernel.org>
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

Hi Simon,

Thanks for flagging this. I analyzed `net/core/rtnetlink.c` and
`drivers/net/ipvlan/ipvlan_main.c` and reproduced all three scenarios in a
User-Mode Linux (UML) environment:

1. Root-Cause Analysis:

   In `rtnl_newlink_create()`, after `ops->newlink()` (`ipvlan_link_new()`)
   returns 0, `rtnl_configure_link()` (which clears
   `dev->rtnl_link_initializing = false`) and `do_set_master()` (when
   `IFLA_MASTER` is supplied) can still fail and jump to `out_unregister`,
   which unwinds the newly created `net_device` via `ops->dellink()`
   (`ipvlan_link_delete()`).

   However, restoring `port->flags` (or `port->mode`) from
   `ipvlan_link_delete()` as suggested in the AI review is not viable:
   `rtnl_newlink_create()` invokes the exact same `ops->dellink()` callback as
   a normal user `RTM_DELLINK` ("ip link del"). Because `dev->rtnl_link_initializing`
   has already been cleared in `rtnl_configure_link()`, `ipvlan_link_delete()`
   cannot distinguish a creation rollback from a normal link deletion, and
   reverting shared port state on normal deletion would break ipvlan's
   documented "latest update overrides" semantics across coexisting ipvlan
   interfaces.

   Note that `rtnl_changelink()` has the exact same rtnetlink transaction
   boundary: `ops->changelink()` (`ipvlan_nl_changelink()`) updates
   `port->mode` and `port->flags` before `do_setlink()` calls
   `do_set_master()`, with no rollback callback if `do_set_master()` fails.

2. Local UML Reproduction Steps and Results:

   Setup in UML (`CONFIG_IPVLAN=y`, `CONFIG_IPVLAN_L3S` unset):
     ip link add veth0 type veth peer name veth0p
     ip link set veth0 up && ip link set veth0p up
     ip link add link veth0 name ipv1 type ipvlan mode l2 bridge

   - Scenario 1 (Failure inside `ipvlan_link_new()` -> `ipvlan_set_port_mode()`,
     fixed by this patch):
       [S1 BEFORE] ipv1: ipvlan mode l2 bridge
       $ ip link add link veth0 name ipv2 type ipvlan mode l3s private
       RTNETLINK answers: Unknown error 524 (-ENOTSUPP)
       [S1 AFTER]  ipv1: ipvlan mode l2 bridge
     With this patch, `port->flags` is untouched when `ipvlan_set_port_mode()`
     fails inside `ipvlan_link_new()`.

   - Scenario 2 (Post-newlink failure in `rtnl_newlink_create()` ->
     `do_set_master()`):
       [S2 BEFORE] ipv1: ipvlan mode l2 bridge
       $ ip link add link veth0 name ipv2 master lo type ipvlan mode l3 private
       RTNETLINK answers: Operation not supported (-EOPNOTSUPP)
       [S2 AFTER]  ipv1: ipvlan mode l3 private
     Here `ipvlan_link_new()` succeeded and returned 0 (committing both
     `port->mode = l3` and `port->flags = private`) before `do_set_master()`
     failed in `rtnl_newlink_create()` and invoked `ops->dellink()`.

   - Scenario 3 (Normal creation followed by normal `ip link del` via
     `ops->dellink()`):
       [S3 INIT]                  ipv1: ipvlan mode l2 bridge
       $ ip link add link veth0 name ipv2 type ipvlan mode l2 vepa
       [S3 AFTER ADD ipv2 (vepa)] ipv1: ipvlan mode l2 vepa
       $ ip link del ipv2
       [S3 AFTER DEL ipv2]        ipv1: ipvlan mode l2 vepa
     Normal `ip link del` calls the same `ops->dellink()` callback and must
     preserve the updated `port->mode` and `port->flags`.

3. Action Taken (v3):

   The v2 commit message overstated the guarantee by implying no failure paths
   remained after `ipvlan_set_port_mode()` without qualifying that this
   applies within `ipvlan_link_new()` itself. I will post a v3 that softens
   and clarifies the commit message to explicitly scope the fix to
   `ipvlan_link_new()` (matching `ipvlan_nl_changelink()`) and note that
   post-`newlink` rollback in `rtnl_newlink_create()` via `ops->dellink()`
   remains outside `ipvlan_link_new()`'s scope, just as for `port->mode`.

Thanks,
Wenbo

pw-bot: cr


