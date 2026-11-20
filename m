Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145097;
	b=VoD7+H3XpCu4ZSgIsTGn5uFfrNpFiFvQonZYlVYMBohqSVCjjFt8Kj8v8bVZs92q8j2y
	 E2I9IWnc+ctZyQrZvzEepzzPhCs4KJRtcplvaTPFNmTlC/Hzk3wyfPs4Aq54qXrF5gUZR
	 MEmMtM72JAN5eq4/heDNdPL7gNKVAW7EYvvYBfqJLDZodaqJvuuqxOmkH2LuzKfoQEXUS
	 ZmQDXsqIX99FL2mh68H3w0cAmiOd/dHKzN1aCCh4pYh41AbbliQSBAi608h3ja50D/jxZ
	 qOkwFtoV4YnfKHxTxIWEFnXBDdPJHipjSnSSxxDbrp0RsSN0qP3jYhp51WiPVl+AtsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145097;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ywp488La+28p+Z75XUYWP0jnuMJfPfCt1TGuzNl5Hdk=;
	b=zKLJI4oUOB6r9zDZT6DP8b3SDfc0CSqOd594cUQDlJTiJ/o+5xNi8Ytov4XeNJD715aF
	 bw3xcpRWMcwms9AB4pW/Psc4EGhoc9LUdkCjxvmBhWjTr6A598eVILwha8P/dSlLOaJXR
	 sbrDSv52XDtZgEmR/mgEul97WeN4XPwvThwZJ/mTrhPvRHVPalv99nqldC75esQ035OuC
	 +cH2JTWE42VPLI3+YRLLocrNrfc5Irt0/UWyzOu4mDVtgS8OV7CRHyfnRb3pgR6zgMSWR
	 iZ/vqp7Fw6LFv5fRPnVJFpueQz5bkas6W/GpaYYRzOdcmSs/XPeUDhxqYQyjnNANq8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rCX8fUwX;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8524606A325;
	Fri, 20 Nov 2026 03:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8524606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rCX8fUwX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rCX8fUwXfMaXZM6PKuakLx2C1p1xyrPxlLjjLnVzssTfvCJjEWjCPb3onzw44NYowZ6W5P9i0q5/E
	 19OixbsLg63mAzULbamBAMBBF74q/FriU8Ordc+CEyaXL1EjWaP/Ad1dbyw5B6EyoTcfVoB+Ya/afh
	 ZVd9rDrlwqz7TyAI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96affbd85671-2907f;
	Fri, 20 Nov 2026 11:24:55 +0800 (CST)
X-RM-TRANSID:2ee96affbd85671-2907f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.net (unknown[223.64.113.192])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46affbd86dde-13bab;
	Fri, 20 Nov 2026 11:24:55 +0800 (CST)
X-RM-TRANSID:2ee46affbd86dde-13bab
From: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
To: Mahesh Bandewar <maheshb@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunwenbo@cmss.chinamobile.com,
	1342116488@qq.com
Subject: [PATCH net v3] ipvlan: update port flags only after ipvlan_set_port_mode() succeeds
Date: Fri, 20 Nov 2026 11:24:38 +0800
Message-Id: <20261120032438.18789-1-sunwenbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
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

In ipvlan_link_new(), port->flags is updated before calling
ipvlan_set_port_mode(). If ipvlan_set_port_mode() fails (for example,
when switching to L3S mode without CONFIG_IPVLAN_L3S), error unwinding
calls unregister_netdevice(dev) via unlink_netdev.

While unregister_netdevice(dev) destroys the port when creating the
first ipvlan device on a lower interface, struct ipvl_port is shared
across all ipvlan interfaces on the same lower device (tracked via
port->count). If another ipvlan interface already exists,
unregister_netdevice(dev) only drops the extra reference and leaves the
shared port alive with the updated port->flags, unintentionally altering
the flags of existing ipvlan interfaces.

Defer updating port->flags until after ipvlan_set_port_mode() succeeds
so that a failure inside ipvlan_link_new() does not modify port->flags,
matching ipvlan_nl_changelink(). Note that failures occurring in
rtnl_newlink_create() after ops->newlink() returns 0 (such as
do_set_master()) roll back via ops->dellink() (which shares the normal
RTM_DELLINK path and does not revert shared port->mode or port->flags)
and are outside the scope of ipvlan_link_new().

This issue was identified with the assistance of an LLM-based code
review tool, confirmed in a User-Mode Linux (UML) environment by
creating a second ipvlan interface that fails in ipvlan_set_port_mode(),
and verified in UML that the existing interface's port flags remain
unchanged upon failure inside ipvlan_link_new().

Fixes: a190d04db937 ("ipvlan: introduce 'private' attribute for all existing modes.")
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
---
v3:
  - Clarify in the commit message that deferring the port->flags update
    prevents failures inside ipvlan_link_new() from modifying
    port->flags (matching ipvlan_nl_changelink()), while noting that
    post-newlink failures in rtnl_newlink_create() (such as
    do_set_master()) unwind via ops->dellink() and remain outside the
    scope of ipvlan_link_new() (Simon Horman, Sashiko review).
  - Add Hangbin Liu's Reviewed-by tag (no code changes from v2).
v2: https://lore.kernel.org/netdev/20261112064821.85624-1-sunwenbo@cmss.chinamobile.com/
  - Clarify in the commit message that when creating a second or
    subsequent ipvlan interface on an already-active port,
    unregister_netdevice() only drops the extra reference rather than
    destroying the shared port (Hangbin Liu).
  - Soften and clarify the wording in the commit message.
v1: https://lore.kernel.org/netdev/20261111064655.233265-1-sunwenbo@cmss.chinamobile.com/

 drivers/net/ipvlan/ipvlan_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ipvlan/ipvlan_main.c b/drivers/net/ipvlan/ipvlan_main.c
index f29864db662a..5732b167c5b3 100644
--- a/drivers/net/ipvlan/ipvlan_main.c
+++ b/drivers/net/ipvlan/ipvlan_main.c
@@ -678,12 +678,6 @@ int ipvlan_link_new(struct net_device *dev, struct rtnl_newlink_params *params,
 	if (err)
 		goto remove_ida;
 
-	/* Flags are per port and latest update overrides. User has
-	 * to be consistent in setting it just like the mode attribute.
-	 */
-	if (data && data[IFLA_IPVLAN_FLAGS])
-		port->flags = nla_get_u16(data[IFLA_IPVLAN_FLAGS]);
-
 	if (data && data[IFLA_IPVLAN_MODE])
 		mode = nla_get_u16(data[IFLA_IPVLAN_MODE]);
 
@@ -691,6 +685,12 @@ int ipvlan_link_new(struct net_device *dev, struct rtnl_newlink_params *params,
 	if (err)
 		goto unlink_netdev;
 
+	/* Flags are per port and latest update overrides. User has
+	 * to be consistent in setting it just like the mode attribute.
+	 */
+	if (data && data[IFLA_IPVLAN_FLAGS])
+		port->flags = nla_get_u16(data[IFLA_IPVLAN_FLAGS]);
+
 	mutex_lock(&port->pnodes_lock);
 	list_add_tail_rcu(&ipvlan->pnode, &port->ipvlans);
 	mutex_unlock(&port->pnodes_lock);
-- 
2.33.0



